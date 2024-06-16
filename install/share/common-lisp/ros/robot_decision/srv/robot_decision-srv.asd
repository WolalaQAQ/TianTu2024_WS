
(cl:in-package :asdf)

(defsystem "robot_decision-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "setgoal" :depends-on ("_package_setgoal"))
    (:file "_package_setgoal" :depends-on ("_package"))
  ))