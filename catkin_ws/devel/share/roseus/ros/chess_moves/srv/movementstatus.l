;; Auto-generated. Do not edit!


(when (boundp 'chess_moves::movementstatus)
  (if (not (find-package "CHESS_MOVES"))
    (make-package "CHESS_MOVES"))
  (shadow 'movementstatus (find-package "CHESS_MOVES")))
(unless (find-package "CHESS_MOVES::MOVEMENTSTATUS")
  (make-package "CHESS_MOVES::MOVEMENTSTATUS"))
(unless (find-package "CHESS_MOVES::MOVEMENTSTATUSREQUEST")
  (make-package "CHESS_MOVES::MOVEMENTSTATUSREQUEST"))
(unless (find-package "CHESS_MOVES::MOVEMENTSTATUSRESPONSE")
  (make-package "CHESS_MOVES::MOVEMENTSTATUSRESPONSE"))

(in-package "ROS")





(defclass chess_moves::movementstatusRequest
  :super ros::object
  :slots ())

(defmethod chess_moves::movementstatusRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass chess_moves::movementstatusResponse
  :super ros::object
  :slots ())

(defmethod chess_moves::movementstatusResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass chess_moves::movementstatus
  :super ros::object
  :slots ())

(setf (get chess_moves::movementstatus :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get chess_moves::movementstatus :datatype-) "chess_moves/movementstatus")
(setf (get chess_moves::movementstatus :request) chess_moves::movementstatusRequest)
(setf (get chess_moves::movementstatus :response) chess_moves::movementstatusResponse)

(defmethod chess_moves::movementstatusRequest
  (:response () (instance chess_moves::movementstatusResponse :init)))

(setf (get chess_moves::movementstatusRequest :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get chess_moves::movementstatusRequest :datatype-) "chess_moves/movementstatusRequest")
(setf (get chess_moves::movementstatusRequest :definition-)
      "---

")

(setf (get chess_moves::movementstatusResponse :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get chess_moves::movementstatusResponse :datatype-) "chess_moves/movementstatusResponse")
(setf (get chess_moves::movementstatusResponse :definition-)
      "---

")



(provide :chess_moves/movementstatus "d41d8cd98f00b204e9800998ecf8427e")


