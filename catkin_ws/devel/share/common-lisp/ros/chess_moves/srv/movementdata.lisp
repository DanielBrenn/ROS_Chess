; Auto-generated. Do not edit!


(cl:in-package chess_moves-srv)


;//! \htmlinclude movementdata-request.msg.html

(cl:defclass <movementdata-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass movementdata-request (<movementdata-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <movementdata-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'movementdata-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name chess_moves-srv:<movementdata-request> is deprecated: use chess_moves-srv:movementdata-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <movementdata-request>) ostream)
  "Serializes a message object of type '<movementdata-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <movementdata-request>) istream)
  "Deserializes a message object of type '<movementdata-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<movementdata-request>)))
  "Returns string type for a service object of type '<movementdata-request>"
  "chess_moves/movementdataRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'movementdata-request)))
  "Returns string type for a service object of type 'movementdata-request"
  "chess_moves/movementdataRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<movementdata-request>)))
  "Returns md5sum for a message object of type '<movementdata-request>"
  "4cd85a70bbf6cd984a90000cc83dfa07")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'movementdata-request)))
  "Returns md5sum for a message object of type 'movementdata-request"
  "4cd85a70bbf6cd984a90000cc83dfa07")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<movementdata-request>)))
  "Returns full string definition for message of type '<movementdata-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'movementdata-request)))
  "Returns full string definition for message of type 'movementdata-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <movementdata-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <movementdata-request>))
  "Converts a ROS message object to a list"
  (cl:list 'movementdata-request
))
;//! \htmlinclude movementdata-response.msg.html

(cl:defclass <movementdata-response> (roslisp-msg-protocol:ros-message)
  ((capture
    :reader capture
    :initarg :capture
    :type cl:boolean
    :initform cl:nil)
   (next_Move
    :reader next_Move
    :initarg :next_Move
    :type cl:string
    :initform ""))
)

(cl:defclass movementdata-response (<movementdata-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <movementdata-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'movementdata-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name chess_moves-srv:<movementdata-response> is deprecated: use chess_moves-srv:movementdata-response instead.")))

(cl:ensure-generic-function 'capture-val :lambda-list '(m))
(cl:defmethod capture-val ((m <movementdata-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader chess_moves-srv:capture-val is deprecated.  Use chess_moves-srv:capture instead.")
  (capture m))

(cl:ensure-generic-function 'next_Move-val :lambda-list '(m))
(cl:defmethod next_Move-val ((m <movementdata-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader chess_moves-srv:next_Move-val is deprecated.  Use chess_moves-srv:next_Move instead.")
  (next_Move m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <movementdata-response>) ostream)
  "Serializes a message object of type '<movementdata-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'capture) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'next_Move))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'next_Move))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <movementdata-response>) istream)
  "Deserializes a message object of type '<movementdata-response>"
    (cl:setf (cl:slot-value msg 'capture) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'next_Move) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'next_Move) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<movementdata-response>)))
  "Returns string type for a service object of type '<movementdata-response>"
  "chess_moves/movementdataResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'movementdata-response)))
  "Returns string type for a service object of type 'movementdata-response"
  "chess_moves/movementdataResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<movementdata-response>)))
  "Returns md5sum for a message object of type '<movementdata-response>"
  "4cd85a70bbf6cd984a90000cc83dfa07")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'movementdata-response)))
  "Returns md5sum for a message object of type 'movementdata-response"
  "4cd85a70bbf6cd984a90000cc83dfa07")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<movementdata-response>)))
  "Returns full string definition for message of type '<movementdata-response>"
  (cl:format cl:nil "bool capture~%string next_Move~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'movementdata-response)))
  "Returns full string definition for message of type 'movementdata-response"
  (cl:format cl:nil "bool capture~%string next_Move~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <movementdata-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'next_Move))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <movementdata-response>))
  "Converts a ROS message object to a list"
  (cl:list 'movementdata-response
    (cl:cons ':capture (capture msg))
    (cl:cons ':next_Move (next_Move msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'movementdata)))
  'movementdata-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'movementdata)))
  'movementdata-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'movementdata)))
  "Returns string type for a service object of type '<movementdata>"
  "chess_moves/movementdata")