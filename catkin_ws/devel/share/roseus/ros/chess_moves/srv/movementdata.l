;; Auto-generated. Do not edit!


(when (boundp 'chess_moves::movementdata)
  (if (not (find-package "CHESS_MOVES"))
    (make-package "CHESS_MOVES"))
  (shadow 'movementdata (find-package "CHESS_MOVES")))
(unless (find-package "CHESS_MOVES::MOVEMENTDATA")
  (make-package "CHESS_MOVES::MOVEMENTDATA"))
(unless (find-package "CHESS_MOVES::MOVEMENTDATAREQUEST")
  (make-package "CHESS_MOVES::MOVEMENTDATAREQUEST"))
(unless (find-package "CHESS_MOVES::MOVEMENTDATARESPONSE")
  (make-package "CHESS_MOVES::MOVEMENTDATARESPONSE"))

(in-package "ROS")





(defclass chess_moves::movementdataRequest
  :super ros::object
  :slots ())

(defmethod chess_moves::movementdataRequest
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

(defclass chess_moves::movementdataResponse
  :super ros::object
  :slots (_capture _next_Move ))

(defmethod chess_moves::movementdataResponse
  (:init
   (&key
    ((:capture __capture) nil)
    ((:next_Move __next_Move) "")
    )
   (send-super :init)
   (setq _capture __capture)
   (setq _next_Move (string __next_Move))
   self)
  (:capture
   (&optional (__capture :null))
   (if (not (eq __capture :null)) (setq _capture __capture)) _capture)
  (:next_Move
   (&optional __next_Move)
   (if __next_Move (setq _next_Move __next_Move)) _next_Move)
  (:serialization-length
   ()
   (+
    ;; bool _capture
    1
    ;; string _next_Move
    4 (length _next_Move)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _capture
       (if _capture (write-byte -1 s) (write-byte 0 s))
     ;; string _next_Move
       (write-long (length _next_Move) s) (princ _next_Move s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _capture
     (setq _capture (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _next_Move
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _next_Move (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass chess_moves::movementdata
  :super ros::object
  :slots ())

(setf (get chess_moves::movementdata :md5sum-) "4cd85a70bbf6cd984a90000cc83dfa07")
(setf (get chess_moves::movementdata :datatype-) "chess_moves/movementdata")
(setf (get chess_moves::movementdata :request) chess_moves::movementdataRequest)
(setf (get chess_moves::movementdata :response) chess_moves::movementdataResponse)

(defmethod chess_moves::movementdataRequest
  (:response () (instance chess_moves::movementdataResponse :init)))

(setf (get chess_moves::movementdataRequest :md5sum-) "4cd85a70bbf6cd984a90000cc83dfa07")
(setf (get chess_moves::movementdataRequest :datatype-) "chess_moves/movementdataRequest")
(setf (get chess_moves::movementdataRequest :definition-)
      "---
bool capture
string next_Move
")

(setf (get chess_moves::movementdataResponse :md5sum-) "4cd85a70bbf6cd984a90000cc83dfa07")
(setf (get chess_moves::movementdataResponse :datatype-) "chess_moves/movementdataResponse")
(setf (get chess_moves::movementdataResponse :definition-)
      "---
bool capture
string next_Move
")



(provide :chess_moves/movementdata "4cd85a70bbf6cd984a90000cc83dfa07")


