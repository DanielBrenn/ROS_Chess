#!/usr/bin/env python3.8
#server 

import rospy
from std_msgs.msg import String
from stockfish import Stockfish
import rospkg
import time
import sys
import time
from chess_moves.srv import *

def next_move_service(c_flag,p_move):      #c_flag: capture flag c_place: capture place p_move: piece move E.g:(from 'e4'-->to 'e6') 
    rospy.wait_for_service('robot_move_service')
    try:
        move_data = rospy.ServiceProxy('robot_move_service', movementdata)
        resp1=move_data(capture=c_flag, next_Move=p_move)
        return resp1
    except rospy.ServiceException as e:
        print("Service call failed: %s"%e)

rospy.init_node("chess_manager")
#Stockfish setup
rospack = rospkg.RosPack()
path = rospack.get_path('mogi_chess_stockfish')
stockfish_path = path + "/stockfish/stockfish_13_linux_x64_bmi2"
#print(stockfish_path)
stockfish = Stockfish(stockfish_path, parameters={"Threads": 2, "Minimum Thinking Time": 30})
stockfish.set_skill_level(20)
print(f"Using Stockfish v{stockfish.get_stockfish_major_version()}, skill level: {stockfish.get_parameters()['Skill Level']}")

last_state=''
current_state=stockfish.get_fen_position()
end_game=False


#Stockfish game
while end_game!=True:                 #oversimplified check mate detection the new changed set is the same to the last move
    capture_flag=False
    current_state=stockfish.get_fen_position()

    rospy.loginfo(stockfish.get_board_visual())
    next_move = stockfish.get_best_move_time(1000)
    capture_move = stockfish.is_move_correct(next_move)
    if capture_move==True:                          #if step valid set move
        if stockfish.get_what_is_on_square(next_move[2:4])!=None:           #check if there is a capcutre move
            capture_flag=True                                               #This flag show if addition moves are needed to remove a chess_piece
            rospy.loginfo("Remove from: " + next_move[2:4])

        stockfish.make_moves_from_current_position([next_move])
        if last_state==current_state:           #Check if it is a check mate
            end_game=False
        last_state=stockfish.get_fen_position()
    next_move_service(capture_flag,next_move)





