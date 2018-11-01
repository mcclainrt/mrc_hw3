#roslaunch turtleL.launch -- There has to be a way to do this?


rosservice call reset # Resets turtlesim_node

# Change background color
rosparam set /background_r 255
rosparam set /background_g 105
rosparam set /background_b 180
rosservice call clear

rosservice call turtle1/set_pen 0 0 255 5 1 # Sets turtle 1 pen off
rosservice call turtle1/teleport_absolute 2 3 0 # moves turtle one to starting position
rosservice call turtle1/set_pen 0 0 255 5 0 # Sets turtle 1 pen on
rosservice call spawn 5 3 1.56 "" # spawns turtle2 at desired location
rosservice call turtle2/set_pen 0 255 0 5 0 # Sets turtle 2 pen to green

# Drawing R
rostopic pub -1 /turtle1/cmd_vel geometry_msgs/Twist -- '[0, 0, 0]' '[0, 0, 1.56]'
rostopic pub -1 /turtle1/cmd_vel geometry_msgs/Twist -- '[3, 0, 0]' '[0, 0, 0]'
rostopic pub -1 /turtle1/cmd_vel geometry_msgs/Twist -- '[4, 0, 0]' '[0, 0, -4.712]'
rostopic pub -1 /turtle1/cmd_vel geometry_msgs/Twist -- '[.8, 0, 0]' '[0, 0, 0]'
rostopic pub -1 /turtle1/cmd_vel geometry_msgs/Twist -- '[0, 0, 0]' '[0, 0, 3.142]'
rostopic pub -1 /turtle1/cmd_vel geometry_msgs/Twist -- '[.6, 0, 0]' '[0, 0, 0]'
rostopic pub -1 /turtle1/cmd_vel geometry_msgs/Twist -- '[0, 0, 0]' '[0, 0, -1.04]'
rostopic pub -1 /turtle1/cmd_vel geometry_msgs/Twist -- '[2.5, 0, 0]' '[0, 0, 0]'

# Drawing i
rostopic pub -1 /turtle2/cmd_vel geometry_msgs/Twist -- '[1, 0, 0]' '[0, 0, 0]'
rosservice call turtle2/set_pen 0 255 0 5 1
rosservice call turtle2/teleport_absolute 5 4.5 1.56
rosservice call turtle2/set_pen 0 255 0 5 0
rostopic pub -1 /turtle2/cmd_vel geometry_msgs/Twist -- '[0.2, 0, 0]' '[0, 0, 0]'

# kill both turtles
rosservice call kill turtle1
rosservice call kill turtle2
