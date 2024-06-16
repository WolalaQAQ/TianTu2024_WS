
(cl:in-package :asdf)

(defsystem "myep_bsae-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "RobotArm" :depends-on ("_package_RobotArm"))
    (:file "_package_RobotArm" :depends-on ("_package"))
    (:file "RobotBlaster" :depends-on ("_package_RobotBlaster"))
    (:file "_package_RobotBlaster" :depends-on ("_package"))
    (:file "RobotGrip" :depends-on ("_package_RobotGrip"))
    (:file "_package_RobotGrip" :depends-on ("_package"))
    (:file "RobotPwm" :depends-on ("_package_RobotPwm"))
    (:file "_package_RobotPwm" :depends-on ("_package"))
  ))