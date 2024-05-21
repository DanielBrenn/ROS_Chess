#!/usr/bin/env python3

import rospy
import math
import inverse_kinematics
from trajectory_msgs.msg import JointTrajectory, JointTrajectoryPoint
from scipy.optimize import fsolve

def table_squares(pos):
    # pos: string input for table position, e.g. 'E4'

    coords = [0,0,0]
    if pos.endswith('1'):
        coords[0]=0.13125
    elif pos.endswith('2'):
        coords[0]=0.09375
    elif pos.endswith('3'):
        coords[0]=0.05625
    elif pos.endswith('4'):
        coords[0]=0.01875
    elif pos.endswith('8'):
        coords[0]=-0.13125
    elif pos.endswith('7'):
        coords[0]=-0.09375
    elif pos.endswith('6'):
        coords[0]=-0.05625
    elif pos.endswith('5'):
        coords[0]=-0.01875

    if pos.startswith('h'):
        coords[1]=0.13125
    elif pos.startswith('g'):
        coords[1]=0.09375
    elif pos.startswith('f'):
        coords[1]=0.05625
    elif pos.startswith('e'):
        coords[1]=0.01875
    elif pos.startswith('a'):
        coords[1]=-0.13125
    elif pos.startswith('b'):
        coords[1]=-0.09375
    elif pos.startswith('c'):
        coords[1]=-0.05625
    elif pos.startswith('d'):
        coords[1]=-0.01875
    return coords


def solve_equations(j2, j3, j4, R, L2, L3, L4):    
    eq1 = j2 + j3 + j4 + math.pi
    eq2 = -L2 * math.sin(j2) - L3 * math.sin(j3) - L4 * math.sin(j4) - R
    eq3 = L2 * math.cos(j2) + L3 * math.cos(j3) + L4 * math.cos(j4) - 1.12

    initial_guess = [0, 0, 0]  # Initial guess for j2, j3, j4
    equations=[eq1, eq2, eq3]
    params = (R, L2, L3, L4)
    solutions = fsolve(equations, initial_guess, args=params)

    j2, j3, j4 = solutions

    return solutions

def inverse_kinematics(coords, gripper_status, gripper_angle=0):
    #param coords: list, desired [X, Y, Z] TCP coordinates
    #param gripper_status: string, can be `closed` or `open`
    #param gripper_angle: float, gripper angle in world coordinate system (0 = horizontal, pi/2 = vertical)
    #return: list, the list of joint angles, including the 2 gripper fingers

    # arm lengths
    L2=1.5
    L3=1.5
    L4=0.2
    R=math.sqrt((coords[0]+1.4)^2+coords[1]^2)

    j1 = math.asin(coords[1]/R)
    j2, j3, j4 = solve_equations(j2, j3, j4, R, L2, L3, L4)

    angles = [0, 0, 0, 0, 0, 0, 0]
    angles[0] = j1
    angles[1] = j2
    angles[2] = j3
    angles[3] = j4
    angles[4] = 0

    if gripper_status == 'closed':
        angles[5] = 0
        angles[6] = 0
    elif gripper_status == 'open':
        angles[5] = 0.015
        angles[6] = 0.015

    return angles


rospy.init_node('send_joint_angles')

pub = rospy.Publisher('/arm_controller/command', JointTrajectory, queue_size=1)

controller_name = "ikin_controller"
joint_names = rospy.get_param("/%s/joints" % controller_name)

rospy.loginfo("Joint names: %s" % joint_names)

rate = rospy.Rate(10)

trajectory_command = JointTrajectory()

trajectory_command.joint_names = joint_names

point = JointTrajectoryPoint()
#['J1_shoulder_pan_joint', 'J2_shoulder_lift_joint', 'J3_elbow_joint', 'J4_wrist_joint',J5_gripper_pan_joint , 'J6_left_finger_joint', 'J7_right_finger_joint']
point.positions = inverse_kinematics(table_squares(position), gripper_status, gripper_angle=0)
point.velocities = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
point.time_from_start = rospy.rostime.Duration(1,0)

trajectory_command.points = [point]

while not rospy.is_shutdown():
    trajectory_command.header.stamp = rospy.Time.now()
    pub.publish(trajectory_command)
    rate.sleep()


