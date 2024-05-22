; Auto-generated. Do not edit!


(cl:in-package chess_moves-srv)


;//! \htmlinclude movementstatus-request.msg.html

(cl:defclass <movementstatus-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass movementstatus-request (<movementstatus-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <movementstatus-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'movementstatus-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name chess_moves-srv:<movementstatus-request> is deprecated: use chess_moves-srv:movementstatus-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <movementstatus-request>) ostream)
  "Serializes a message object of type '<movementstatus-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <movementstatus-request>) istream)
  "Deserializes a message object of type '<movementstatus-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<movementstatus-request>)))
  "Returns string type for a service object of type '<movementstatus-request>"
  "chess_moves/movementstatusRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'movementstatus-request)))
  "Returns string type for a service object of type 'movementstatus-request"
  "chess_moves/movementstatusRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<movementstatus-request>)))
  "Returns md5sum for a message object of type '<movementstatus-request>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'movementstatus-request)))
  "Returns md5sum for a message object of type 'movementstatus-request"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<movementstatus-request>)))
  "Returns full string definition for message of type '<movementstatus-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'movementstatus-request)))
  "Returns full string definition for message of type 'movementstatus-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <movementstatus-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <movementstatus-request>))
  "Converts a ROS message object to a list"
  (cl:list 'movementstatus-request
))
;//! \htmlinclude movementstatus-response.msg.html

(cl:defclass <movementstatus-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass movementstatus-response (<movementstatus-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <movementstatus-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'movementstatus-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name chess_moves-srv:<movementstatus-response> is deprecated: use chess_moves-srv:movementstatus-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <movementstatus-response>) ostream)
  "Serializes a message object of type '<movementstatus-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <movementstatus-response>) istream)
  "Deserializes a message object of type '<movementstatus-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<movementstatus-response>)))
  "Returns string type for a service object of type '<movementstatus-response>"
  "chess_moves/movementstatusResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'movementstatus-response)))
  "Returns string type for a service object of type 'movementstatus-response"
  "chess_moves/movementstatusResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<movementstatus-response>)))
  "Returns md5sum for a message object of type '<movementstatus-response>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'movementstatus-response)))
  "Returns md5sum for a message object of type 'movementstatus-response"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<movementstatus-response>)))
  "Returns full string definition for message of type '<movementstatus-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'movementstatus-response)))
  "Returns full string definition for message of type 'movementstatus-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <movementstatus-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <movementstatus-response>))
  "Converts a ROS message object to a list"
  (cl:list 'movementstatus-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'movementstatus)))
  'movementstatus-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'movementstatus)))
  'movementstatus-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'movementstatus)))
  "Returns string type for a service object of type '<movementstatus>"
  "chess_moves/movementstatus")