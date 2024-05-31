#!/usr/bin/env python3

import rospy
import math
from trajectory_msgs.msg import JointTrajectory, JointTrajectoryPoint
from std_msgs.msg import String
from chess_moves.srv import *
from gazebo_msgs.msg import ContactsState
from gazebo_ros_link_attacher.srv import Attach, AttachRequest, AttachResponse


#Ros service client for chess ai -----------------------------------------------------------------------------------------

def robot_move_client():
    rospy.wait_for_service('robot_move_service')
    try:
        move_data = rospy.ServiceProxy('robot_move_service', movementdata)
        resp1=move_data()
        capture_ret = resp1.capture
        next_move_ret =  resp1.next_Move
        return capture_ret, next_move_ret
    except rospy.ServiceException as e:
        print("Service call failed: %s"%e)

#Contact detection ---------------------------------------------------------------------------------------------------------

class contacts_subscriber:
    
    def __init__(self):
        self.tuched_model=""
        self.sub_contacts = rospy.Subscriber ('/contact_vals', ContactsState, self.callback) 
        print("Initializing the instance!")

    def callback (self,msg):

        if(len(msg.states) != 0):
            if 'left_finger' in msg.states[0].collision1_name:
                self.tuched_model = msg.states[0].collision2_name.split("::")[0]
                print("Tuched piece:%s." % self.tuched_model)
            elif 'left_finger' in msg.states[0].collision2_name:
                self.tuched_model = msg.states[0].collision1_name.split("::")[0]
                print("Tuched piece:%s." % self.tuched_model)
            else:
                rospy.loginfo("Unknown collision")


#Attach piece
def attach_piece(model_name):
    #Contat detect
    attach_srv = rospy.ServiceProxy('/link_attacher_node/attach',Attach)
    attach_srv.wait_for_service()

    # Link them
    req = AttachRequest()
    req.model_name_1 = "chess_bot"
    req.link_name_1 = "left_finger"
    req.model_name_2 = model_name
    req.link_name_2 = "link_0"
    attach_srv.call(req)

#Detach piece
def detach_piece(model_name):
    attach_srv = rospy.ServiceProxy('/link_attacher_node/detach',Attach)
    attach_srv.wait_for_service()

    # Link them
    req = AttachRequest()
    req.model_name_1 = "chess_bot"
    req.link_name_1 = "left_finger"
    req.model_name_2 = model_name
    req.link_name_2 = "link_0"
    attach_srv.call(req)



#Robot movement-----------------------------------------------------------------------------------------------------------
def inverse_kinematics(coords, gripper_status):
    #param coords: list, desired [X, Y, Z] TCP coordinates
    #param gripper_status: string, can be `closed` or `open`
    #param gripper_angle: float, gripper angle in world coordinate system (0 = horizontal, pi/2 = vertical)
    #return: list, the list of joint angles, including the 2 gripper fingers
    #['J1_shoulder_pan_joint', 'J2_shoulder_lift_joint', 'J3_elbow_joint', 'J4_wrist_joint',J5_gripper_pan_joint , 'J6_left_finger_joint', 'J7_right_finger_joint']
    
    # arm lengths
    ua_link=1.5
    fa_link=1.5
    
    tcp_link=0.175+0.2-0.02  #offset from wrist joint
    z_offset=0.05   #robot base thickness
    gripper_angle=math.pi/2 #tcp(actuator) alway points down

    #Robot angle->j1 and actuator angle->j5 
    j1 = math.atan2(coords[1],coords[0])     #shoulder_pan_joint
    j5 = j1                                #gripper_pan_joint-->j1=-j5 it will cause the head to look (always) into the same way
    
    # Re-calculate target coordinated to the wrist joint (x', y', z')
    x = coords[0] - tcp_link * math.cos(j1) * math.cos(gripper_angle)
    y = coords[1] - tcp_link * math.sin(j1) * math.cos(gripper_angle)
    z = coords[2] - z_offset + math.sin(gripper_angle) * tcp_link
    
    x = math.sqrt(y*y + x*x)

    # Let's calculate auxiliary lengths and angles
    c = math.sqrt(x*x + z*z)
    alpha = math.asin(z/c)
    beta = math.pi - alpha
    # Apply law of cosines
    gamma = math.acos((ua_link*ua_link + c*c - fa_link*fa_link)/(2*c*ua_link))

    j2 = math.pi/2.0 - alpha - gamma
    j3 = math.pi - math.acos((ua_link*ua_link + fa_link*fa_link - c*c)/(2*ua_link*fa_link)) # j2 = 180 - j2'
    j4 = math.pi-j2-j3  #tcp(actuator) alway points down

    angles = [0, 0, 0, 0, 0, 0, 0]
    angles[0] = j1
    angles[1] = j2
    angles[2] = j3
    angles[3] = j4
    angles[4] = j5

    if gripper_status == 'closed':
        angles[5] = 0
        angles[6] = 0
    elif gripper_status == 'open':
        angles[5] = 0.007
        angles[6] = 0.007

    return angles

#Table for chess_position
def table_squares(pos):
    # pos: string input for table position, e.g. 'e4'
    coords = [0,0,0]
    if pos[1]=='1':
        coords[0]=-0.13125
    elif pos[1]=='2':
        coords[0]=-0.09375
    elif pos[1]=='3':
        coords[0]=-0.05625
    elif pos[1]=='4':
        coords[0]=-0.01875
    elif pos[1]=='8':
        coords[0]=0.13125
    elif pos[1]=='7':
        coords[0]=0.09375
    elif pos[1]=='6':
        coords[0]=0.05625
    elif pos[1]=='5':
        coords[0]=0.01875

    if pos[0]=='h':
        coords[1]=-0.13125
    elif pos[0]=='g':
        coords[1]=-0.09375
    elif pos[0]=='f':
        coords[1]=-0.05625
    elif pos[0]=='e':
        coords[1]=-0.01875
    elif pos[0]=='a':
        coords[1]=0.13125
    elif pos[0]=='b':
        coords[1]=0.09375
    elif pos[0]=='c':
        coords[1]=0.05625
    elif pos[0]=='d':
        coords[1]=0.01875
    return coords

#Offset correction between robot and chessboard origin
def chess_move(next_chess_move):
    chess_piece_origin_offset=[1.2,0,1.1]     #offset this list is dependent on world setup [x,y,z]
    next_pozition=[0,0,0]
    next_pozition[0]=chess_piece_origin_offset[0]+next_chess_move[0]
    next_pozition[1]=chess_piece_origin_offset[1]+next_chess_move[1]
    next_pozition[2]=chess_piece_origin_offset[2]+next_chess_move[2]
    
    return next_pozition

def send_joint_state(position):
     #position:['J1_shoulder_pan_joint', 'J2_shoulder_lift_joint', 'J3_elbow_joint', 'J4_wrist_joint',J5_gripper_pan_joint , 'J6_left_finger_joint', 'J7_right_finger_joint']
    point.positions=position
    #point.velocities=velocitiy
    trajectory_command.header.stamp = rospy.Time.now()
    pub.publish(trajectory_command)

rospy.init_node('trajectory_contact_controll')


#Contacts detection
contacts_sub = contacts_subscriber()

pub = rospy.Publisher('/arm_controller/command', JointTrajectory, queue_size=1)
controller_name = "arm_controller"
joint_names = rospy.get_param("/%s/joints" % controller_name)
rospy.loginfo("Joint names: %s" % joint_names)

rate = rospy.Rate(10)
trajectory_command = JointTrajectory()
trajectory_command.joint_names = joint_names
point = JointTrajectoryPoint()

#point.positions = inverse_kinematics(table_squares(next_move), "closed", gripper_angle=0)
point.time_from_start = rospy.rostime.Duration(1,0)
trajectory_command.points = [point]
rospy.sleep(1)

sleepTime=1


while not rospy.is_shutdown():
    
    capture, next_chess_move = robot_move_client() #Requests data form service server a writes to the capture, next_chess_move

    rospy.loginfo(capture)
    rospy.loginfo(next_chess_move)
    #chess_trajectory_control(capture, next_move, 1) this will be replaced 
    print(capture)
    from_pozitionXYZ=table_squares(next_chess_move[0:2])
    to_pozitionXYZ=table_squares(next_chess_move[2:4])
    from_move_space_place=table_squares(next_chess_move[0:2])
    to_move_space_place=table_squares(next_chess_move[2:4])
    move_space_hight=0.1
    
    from_move_space_place[2]=move_space_hight             
    to_move_space_place[2]=move_space_hight
        
    if capture == True:        
        #move directly above the chess piece

        send_joint_state(inverse_kinematics(chess_move(to_move_space_place),'open'))
        rospy.sleep(sleepTime)
        #move down to grab the piece
        send_joint_state(inverse_kinematics(chess_move(to_pozitionXYZ),'open'))
        rospy.sleep(sleepTime)
        #move down to grab the piece
        send_joint_state(inverse_kinematics(chess_move(to_pozitionXYZ),'close'))
        #attach piece to arm
        print("Attach:%s." % contacts_sub.tuched_model)
        rospy.sleep(1.5)
        attach_piece(contacts_sub.tuched_model)
        rospy.sleep(0.2)
        attach_piece(contacts_sub.tuched_model)
        rospy.sleep(0.2)
        #move to free move space
        send_joint_state(inverse_kinematics(chess_move(to_move_space_place),'close'))
        rospy.sleep(sleepTime)
        #move to free move space
        send_joint_state(inverse_kinematics(chess_move([0,0.2,move_space_hight]),'close'))
        rospy.sleep(sleepTime)
        #detach piece from arm
        print("Detach:%s." % contacts_sub.tuched_model)
        rospy.sleep(0.2)
        detach_piece(contacts_sub.tuched_model)
        #move to free move space
        send_joint_state(inverse_kinematics(chess_move([0,0.2,move_space_hight]),'open'))
        rospy.sleep(sleepTime)
    contacts_sub.tuched_model=""
    send_joint_state(inverse_kinematics(chess_move(from_move_space_place),'open'))
    rospy.sleep(sleepTime)
    #move down to grab the piece
    send_joint_state(inverse_kinematics(chess_move(from_pozitionXYZ),'open'))
    rospy.sleep(sleepTime)
    #move down to grab the piece
    send_joint_state(inverse_kinematics(chess_move(from_pozitionXYZ),'close'))
    #attach piece to arm
    print("Attach:%s." % contacts_sub.tuched_model)
    rospy.sleep(sleepTime)
    attach_piece(contacts_sub.tuched_model)
    #move to free move space
    send_joint_state(inverse_kinematics(chess_move(from_move_space_place),'close'))
    rospy.sleep(sleepTime)
    #move to free move space
    send_joint_state(inverse_kinematics(chess_move(to_move_space_place),'close'))
    rospy.sleep(sleepTime)
    #move to free move space
    send_joint_state(inverse_kinematics(chess_move(to_pozitionXYZ),'close'))
    #detach piece from arm
    rospy.sleep(sleepTime)
    print("Detach:%s." % contacts_sub.tuched_model)
    rospy.sleep(sleepTime)
    detach_piece(contacts_sub.tuched_model)
    #open fingers
    send_joint_state(inverse_kinematics(chess_move(to_pozitionXYZ),'open'))
    rospy.sleep(sleepTime)
    #move to free move space
    send_joint_state(inverse_kinematics(chess_move(to_move_space_place),'open'))
    rospy.sleep(sleepTime)
    contacts_sub.tuched_model=""
