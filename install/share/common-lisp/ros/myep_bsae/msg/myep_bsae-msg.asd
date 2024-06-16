
(cl:in-package :asdf)

(defsystem "myep_bsae-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "GimbalCmd" :depends-on ("_package_GimbalCmd"))
    (:file "_package_GimbalCmd" :depends-on ("_package"))
    (:file "GimbalCmd_ab" :depends-on ("_package_GimbalCmd_ab"))
    (:file "_package_GimbalCmd_ab" :depends-on ("_package"))
    (:file "GimbalFdb" :depends-on ("_package_GimbalFdb"))
    (:file "_package_GimbalFdb" :depends-on ("_package"))
  ))