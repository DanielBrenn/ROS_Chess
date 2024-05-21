# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(FATAL_ERROR "Could not find messages which '/home/bd/Documents/GitHub/ROS_Chess/catkin_ws/src/chess_moves/srv/movementdata.srv' depends on. Did you forget to specify generate_messages(DEPENDENCIES ...)?
Cannot locate message [int]: unknown package [chess_moves] on search path [{'actionlib_msgs': ['/opt/ros/noetic/share/actionlib_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/noetic/share/std_msgs/cmake/../msg']}]")
message(STATUS "chess_moves: 0 messages, 3 services")

set(MSG_I_FLAGS "-Iactionlib_msgs:/opt/ros/noetic/share/actionlib_msgs/cmake/../msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(chess_moves_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/bd/Documents/GitHub/ROS_Chess/catkin_ws/src/chess_moves/srv/movementstatus.srv" NAME_WE)
add_custom_target(_chess_moves_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "chess_moves" "/home/bd/Documents/GitHub/ROS_Chess/catkin_ws/src/chess_moves/srv/movementstatus.srv" ""
)

get_filename_component(_filename "/home/bd/Documents/GitHub/ROS_Chess/catkin_ws/src/chess_moves/srv/movementtype.srv" NAME_WE)
add_custom_target(_chess_moves_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "chess_moves" "/home/bd/Documents/GitHub/ROS_Chess/catkin_ws/src/chess_moves/srv/movementtype.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(chess_moves
  "/home/bd/Documents/GitHub/ROS_Chess/catkin_ws/src/chess_moves/srv/movementstatus.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/chess_moves
)
_generate_srv_cpp(chess_moves
  "/home/bd/Documents/GitHub/ROS_Chess/catkin_ws/src/chess_moves/srv/movementtype.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/chess_moves
)

### Generating Module File
_generate_module_cpp(chess_moves
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/chess_moves
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(chess_moves_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(chess_moves_generate_messages chess_moves_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/bd/Documents/GitHub/ROS_Chess/catkin_ws/src/chess_moves/srv/movementstatus.srv" NAME_WE)
add_dependencies(chess_moves_generate_messages_cpp _chess_moves_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bd/Documents/GitHub/ROS_Chess/catkin_ws/src/chess_moves/srv/movementtype.srv" NAME_WE)
add_dependencies(chess_moves_generate_messages_cpp _chess_moves_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(chess_moves_gencpp)
add_dependencies(chess_moves_gencpp chess_moves_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS chess_moves_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(chess_moves
  "/home/bd/Documents/GitHub/ROS_Chess/catkin_ws/src/chess_moves/srv/movementstatus.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/chess_moves
)
_generate_srv_eus(chess_moves
  "/home/bd/Documents/GitHub/ROS_Chess/catkin_ws/src/chess_moves/srv/movementtype.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/chess_moves
)

### Generating Module File
_generate_module_eus(chess_moves
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/chess_moves
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(chess_moves_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(chess_moves_generate_messages chess_moves_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/bd/Documents/GitHub/ROS_Chess/catkin_ws/src/chess_moves/srv/movementstatus.srv" NAME_WE)
add_dependencies(chess_moves_generate_messages_eus _chess_moves_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bd/Documents/GitHub/ROS_Chess/catkin_ws/src/chess_moves/srv/movementtype.srv" NAME_WE)
add_dependencies(chess_moves_generate_messages_eus _chess_moves_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(chess_moves_geneus)
add_dependencies(chess_moves_geneus chess_moves_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS chess_moves_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(chess_moves
  "/home/bd/Documents/GitHub/ROS_Chess/catkin_ws/src/chess_moves/srv/movementstatus.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/chess_moves
)
_generate_srv_lisp(chess_moves
  "/home/bd/Documents/GitHub/ROS_Chess/catkin_ws/src/chess_moves/srv/movementtype.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/chess_moves
)

### Generating Module File
_generate_module_lisp(chess_moves
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/chess_moves
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(chess_moves_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(chess_moves_generate_messages chess_moves_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/bd/Documents/GitHub/ROS_Chess/catkin_ws/src/chess_moves/srv/movementstatus.srv" NAME_WE)
add_dependencies(chess_moves_generate_messages_lisp _chess_moves_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bd/Documents/GitHub/ROS_Chess/catkin_ws/src/chess_moves/srv/movementtype.srv" NAME_WE)
add_dependencies(chess_moves_generate_messages_lisp _chess_moves_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(chess_moves_genlisp)
add_dependencies(chess_moves_genlisp chess_moves_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS chess_moves_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(chess_moves
  "/home/bd/Documents/GitHub/ROS_Chess/catkin_ws/src/chess_moves/srv/movementstatus.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/chess_moves
)
_generate_srv_nodejs(chess_moves
  "/home/bd/Documents/GitHub/ROS_Chess/catkin_ws/src/chess_moves/srv/movementtype.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/chess_moves
)

### Generating Module File
_generate_module_nodejs(chess_moves
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/chess_moves
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(chess_moves_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(chess_moves_generate_messages chess_moves_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/bd/Documents/GitHub/ROS_Chess/catkin_ws/src/chess_moves/srv/movementstatus.srv" NAME_WE)
add_dependencies(chess_moves_generate_messages_nodejs _chess_moves_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bd/Documents/GitHub/ROS_Chess/catkin_ws/src/chess_moves/srv/movementtype.srv" NAME_WE)
add_dependencies(chess_moves_generate_messages_nodejs _chess_moves_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(chess_moves_gennodejs)
add_dependencies(chess_moves_gennodejs chess_moves_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS chess_moves_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(chess_moves
  "/home/bd/Documents/GitHub/ROS_Chess/catkin_ws/src/chess_moves/srv/movementstatus.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/chess_moves
)
_generate_srv_py(chess_moves
  "/home/bd/Documents/GitHub/ROS_Chess/catkin_ws/src/chess_moves/srv/movementtype.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/chess_moves
)

### Generating Module File
_generate_module_py(chess_moves
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/chess_moves
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(chess_moves_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(chess_moves_generate_messages chess_moves_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/bd/Documents/GitHub/ROS_Chess/catkin_ws/src/chess_moves/srv/movementstatus.srv" NAME_WE)
add_dependencies(chess_moves_generate_messages_py _chess_moves_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bd/Documents/GitHub/ROS_Chess/catkin_ws/src/chess_moves/srv/movementtype.srv" NAME_WE)
add_dependencies(chess_moves_generate_messages_py _chess_moves_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(chess_moves_genpy)
add_dependencies(chess_moves_genpy chess_moves_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS chess_moves_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/chess_moves)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/chess_moves
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_cpp)
  add_dependencies(chess_moves_generate_messages_cpp actionlib_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/chess_moves)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/chess_moves
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_eus)
  add_dependencies(chess_moves_generate_messages_eus actionlib_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/chess_moves)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/chess_moves
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_lisp)
  add_dependencies(chess_moves_generate_messages_lisp actionlib_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/chess_moves)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/chess_moves
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_nodejs)
  add_dependencies(chess_moves_generate_messages_nodejs actionlib_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/chess_moves)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/chess_moves\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/chess_moves
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_py)
  add_dependencies(chess_moves_generate_messages_py actionlib_msgs_generate_messages_py)
endif()
