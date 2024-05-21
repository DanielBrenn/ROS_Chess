#!/usr/bin/env python3.8
#server 

import rospy
from std_msgs.msg import String
from stockfish import Stockfish
import rospkg
import time
import sys
import time
#from chess_msgs.srv import MovementStatus, MovementStatusResponse # type: ignore

#def response_state(request):
#    if request.next_move == True:
#        return MovementStatusResponse()
#    else: 
#        return MovementStatusResponse()
    

#Service_Server setup:
#rospy.init_node("chess_manager")
#service =rospy.Service("robot_status",MovementStatus,response_state)





#Stockfish setup
rospack = rospkg.RosPack()
path = rospack.get_path('mogi_chess_stockfish')
stockfish_path = path + "/stockfish/stockfish_13_linux_x64_bmi2"
print(stockfish_path)
stockfish = Stockfish(stockfish_path, parameters={"Threads": 2, "Minimum Thinking Time": 30})
stockfish.set_skill_level(20)
print(f"Using Stockfish v{stockfish.get_stockfish_major_version()}, skill level: {stockfish.get_parameters()['Skill Level']}")

last_state=''
current_state=stockfish.get_fen_position()
end_game=False

rospy.init_node('chess_manager')
while end_game!=True:                 #oversimplified check mate detection the new changed set is the same to the last move
    
    current_state=stockfish.get_fen_position()

    rospy.loginfo(stockfish.get_board_visual())
    next_move = stockfish.get_best_move_time(1000)
    if stockfish.is_move_correct(next_move)==True:                          #if step valid set move

        if stockfish.get_what_is_on_square(next_move[2:4])!=None:           #check if there is a capcutre move
            #rospy.wait_for_service()
            rospy.loginfo("Remove from: " + next_move[2:4])
            #Here where the robot will remove the piece before makes the move

        stockfish.make_moves_from_current_position([next_move])
        if last_state==current_state:           #Check if it is a check mate
            end_game=False
        last_state=stockfish.get_fen_position()
        




