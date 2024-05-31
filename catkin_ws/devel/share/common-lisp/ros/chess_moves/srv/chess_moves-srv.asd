
(cl:in-package :asdf)

(defsystem "chess_moves-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "movementdata" :depends-on ("_package_movementdata"))
    (:file "_package_movementdata" :depends-on ("_package"))
  ))