#!/usr/bin/env python3.8

import rospy
import sys
import rospkg
from std_msgs.msg import String
from chess_moves.srv import movementdataResponse, movementdata

def response_state(req):
    print((req.capture))
    print((req.capture_Place))
    print((req.next_Move))
    return movementdataResponse()


def robot_move_server():
    rospy.init_node("robot_move_server")
    s =rospy.Service("robot_move_service", movementdata, response_state)
    rospy.spin()

robot_move_server()

