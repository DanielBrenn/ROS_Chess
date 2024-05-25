# ROS_Chess
# Project állapot
- Környezet
- Robot szimuláció 
- Robot kézivezérlő
  

# Futtatás
1. ROS_Chess git projekten belül carkin_ws megnyitása terminálon belül ezt érdemes minden új terminál ablaknál megtenni. Git alapértelmezett beállítás esetén: 
```console
cd ~/Documents/GitHub/ROS_Chess/catkin_ws
```
2. Minden terminál ablakon belül be kell tölteni a projectet (ha valami nem működik akkor valószínűleg ennek a lépésnek a hiánya okozza):
```console
source devel/setup.bash
```
3. Környezet és vezérlő indítása
3.1. Robot szimuláció, Gazebo környezet, Rosmaster indítása és vezérlő paramétereinek előkészítése 
```console
roslaunch ros_chess spawn_robot.launch
```
3.2. Robot vezérlő indítása 
```console
rosrun rqt_joint_trajectory_controller rqt_joint_trajectory_controller
```
4. Fontosabb egyéb program:
4.1. PID hangoláshoz:
```console
rosrun rqt_reconfigure rqt_reconfigure
```
4.2. rqt minden máshoz (rosmaster-nek futnia kell):
```console
rqt
```

5. Stockfish sakkozó AI letöltése
```console
$ pip install stockfish
```
Majd
```console
$ sudo apt install stockfish
```

# Kamera
1. A kameránkat úgy helyeztük el, hogy az 1. csukló alatti ```Gripper_base_link``` részhez rögzítettük és felülről látja be a táblánkat, emiatt nem volt szükség több, különböző kamerára. Első lépésként a ```chess_robot.xacro``` fájlba helyeztük be a camera_link -et:
```console
<!-- Camera -->
  <joint type="fixed" name="camera_joint">
    <origin xyz="1.3 0 1.5" rpy="0 0.2 -3.14"/>
    <child link="camera_link"/>
    <parent link="base_link"/>
    <axis xyz="0 1 0" />
  </joint>

  <link name='camera_link'>
    <pose>0 0 0 0 0 0</pose>
    <inertial>
      <mass value="0.1"/>
      <origin xyz="0 0 0" rpy="0 0 0"/>
      <inertia
          ixx="1e-6" ixy="0" ixz="0"
          iyy="1e-6" iyz="0"
          izz="1e-6"
      />
    </inertial>

    <collision name='collision'>
      <origin xyz="0 0 0" rpy="0 0 0"/> 
      <geometry>
        <box size=".05 .05 .05"/>
      </geometry>
    </collision>

    <visual name='camera_link_visual'>
      <origin xyz="0 0 0" rpy="0 0 0"/>
      <geometry>
        <box size=".05 .05 .05"/>
      </geometry>
    </visual>

  </link>

  <gazebo reference="camera_link">
    <material>Gazebo/Blue</material>
  </gazebo>

  <joint type="fixed" name="camera_optical_joint">
    <origin xyz="0 0 0" rpy="-1.5707 0 -1.5707"/>
    <child link="camera_link_optical"/>
    <parent link="camera_link"/>
  </joint>

  <link name="camera_link_optical">
  </link>
```

Itt meghatároztuk, hogy a pozíciónk ``` <origin xyz="1.3 0 1.5" rpy="0 0.2 -3.14"/>``` legyen 
Ezt követően a chess_robot.gazebo -ba behelyezzük a kameránknak a plug-in-ját, amivel tudunk szimulálni:
```console
<!-- Camera -->
  <gazebo reference="camera_link">
    <sensor type="camera" name="camera1">
      <update_rate>30.0</update_rate>
      <visualize>true</visualize>
      <camera name="head">
        <horizontal_fov>1.3962634</horizontal_fov>
        <image>
          <width>640</width>
          <height>480</height>
          <format>R8G8B8</format>
        </image>
        <clip>
          <near>0.01</near>
          <far>25.0</far>
        </clip>
        <noise>
          <type>gaussian</type>
          <!-- Noise is sampled independently per pixel on each frame.
               That pixel's noise value is added to each of its color
               channels, which at that point lie in the range [0,1]. -->
          <mean>0.0</mean>
          <stddev>0.007</stddev>
        </noise>
      </camera>
      <plugin name="camera_controller" filename="libgazebo_ros_camera.so">
        <alwaysOn>true</alwaysOn>
        <updateRate>0.0</updateRate>
        <cameraName>head_camera</cameraName>
        <imageTopicName>image_raw</imageTopicName>
        <cameraInfoTopicName>camera_info</cameraInfoTopicName>
        <frameName>camera_link_optical</frameName>
        <hackBaseline>0.07</hackBaseline>
        <distortionK1>0.0</distortionK1>
        <distortionK2>0.0</distortionK2>
        <distortionK3>0.0</distortionK3>
        <distortionT1>0.0</distortionT1>
        <distortionT2>0.0</distortionT2>
      </plugin>
    </sensor>
  </gazebo>
```
Inverz kinematika
Az inverse_kinematics.py scriptben definiáljuk a robotkar csukókoordinátáinak számolását.
import math
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

    if pos.startswith('H'):
        coords[0]=0.13125
    elif pos.startswith('G'):
        coords[0]=0.09375
    elif pos.startswith('F'):
        coords[0]=0.05625
    elif pos.startswith('E'):
        coords[0]=0.01875
    elif pos.startswith('A'):
        coords[0]=-0.13125
    elif pos.startswith('B'):
        coords[0]=-0.09375
    elif pos.startswith('C'):
        coords[0]=-0.05625
    elif pos.startswith('D'):
        coords[0]=-0.01875

def solve_equations(j2, j3, j4, R, L2, L3, L4):    
    eq1 = j2 + j3 + j4 + np.pi
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



