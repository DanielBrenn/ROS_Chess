#!/usr/bin/env python3

import rospy
from trajectory_msgs.msg import JointTrajectory, JointTrajectoryPoint



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
point.positions = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
point.velocities = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
point.time_from_start = rospy.rostime.Duration(1,0)

trajectory_command.points = [point]

while not rospy.is_shutdown():
    trajectory_command.header.stamp = rospy.Time.now()
    pub.publish(trajectory_command)
    rate.sleep()


