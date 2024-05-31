#!/usr/bin/env python3

import rospy

from gazebo_msgs.msg import ContactsState
from gazebo_ros_link_attacher.srv import Attach, AttachRequest, AttachResponse

def get_contacts (msg):
    global tuched_model
    
    if (len(msg.states) == 0):
        rospy.loginfo("No contacts were detected!")
    else:
        if 'left_finger' in msg.states[0].collision1_name:
            rospy.loginfo("Collision detected with %s." % msg.states[0].collision2_name.split("::")[0])
            tuched_model = msg.states[0].collision2_name.split("::")[0]
        elif 'left_finger' in msg.states[0].collision2_name:
            rospy.loginfo("Collision detected with %s." % msg.states[0].collision1_name.split("::")[0])      
            tuched_model = msg.states[0].collision2_name.split("::")[0]
        else:
            rospy.loginfo("Unknown collision")



    
rospy.init_node('collision_detector')

sub_contacts = rospy.Subscriber ('/contact_vals', ContactsState, get_contacts)

#Attach part
tuched_model = ''
if __name__ == '__main__':
    rospy.loginfo("Creating ServiceProxy to /link_attacher_node/attach")
    attach_srv = rospy.ServiceProxy('/link_attacher_node/attach',Attach)
    attach_srv.wait_for_service()
    rospy.loginfo("Created ServiceProxy to /link_attacher_node/attach")

    # Link them
    rospy.loginfo("Attaching gripper and red box.")
    req = AttachRequest()
    req.model_name_1 = "chess_bot"
    req.link_name_1 = "left_finger"
    req.model_name_2 = tuched_model
    req.link_name_2 = "link"

    attach_srv.call(req)
#Detach part
    rospy.loginfo("Creating ServiceProxy to /link_attacher_node/detach")
    attach_srv = rospy.ServiceProxy('/link_attacher_node/detach',Attach)
    attach_srv.wait_for_service()
    rospy.loginfo("Created ServiceProxy to /link_attacher_node/detach")

    # Link them
    rospy.loginfo("Detaching gripper and red box.")
    req = AttachRequest()
    req.model_name_1 = "mogi_bot"
    req.link_name_1 = "left_finger"
    req.model_name_2 = tuched_model
    req.link_name_2 = "link"

    attach_srv.call(req)

rospy.spin()