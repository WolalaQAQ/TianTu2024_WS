;; Auto-generated. Do not edit!


(when (boundp 'myep_bsae::RobotArm)
  (if (not (find-package "MYEP_BSAE"))
    (make-package "MYEP_BSAE"))
  (shadow 'RobotArm (find-package "MYEP_BSAE")))
(unless (find-package "MYEP_BSAE::ROBOTARM")
  (make-package "MYEP_BSAE::ROBOTARM"))
(unless (find-package "MYEP_BSAE::ROBOTARMREQUEST")
  (make-package "MYEP_BSAE::ROBOTARMREQUEST"))
(unless (find-package "MYEP_BSAE::ROBOTARMRESPONSE")
  (make-package "MYEP_BSAE::ROBOTARMRESPONSE"))

(in-package "ROS")





(defclass myep_bsae::RobotArmRequest
  :super ros::object
  :slots (_x _y ))

(defmethod myep_bsae::RobotArmRequest
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:serialization-length
   ()
   (+
    ;; float32 _x
    4
    ;; float32 _y
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _x
       (sys::poke _x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y
       (sys::poke _y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y
     (setq _y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass myep_bsae::RobotArmResponse
  :super ros::object
  :slots (_result ))

(defmethod myep_bsae::RobotArmResponse
  (:init
   (&key
    ((:result __result) 0)
    )
   (send-super :init)
   (setq _result (round __result))
   self)
  (:result
   (&optional __result)
   (if __result (setq _result __result)) _result)
  (:serialization-length
   ()
   (+
    ;; uint8 _result
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _result
       (write-byte _result s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _result
     (setq _result (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(defclass myep_bsae::RobotArm
  :super ros::object
  :slots ())

(setf (get myep_bsae::RobotArm :md5sum-) "ca73bd755846e340fdd096df095b3706")
(setf (get myep_bsae::RobotArm :datatype-) "myep_bsae/RobotArm")
(setf (get myep_bsae::RobotArm :request) myep_bsae::RobotArmRequest)
(setf (get myep_bsae::RobotArm :response) myep_bsae::RobotArmResponse)

(defmethod myep_bsae::RobotArmRequest
  (:response () (instance myep_bsae::RobotArmResponse :init)))

(setf (get myep_bsae::RobotArmRequest :md5sum-) "ca73bd755846e340fdd096df095b3706")
(setf (get myep_bsae::RobotArmRequest :datatype-) "myep_bsae/RobotArmRequest")
(setf (get myep_bsae::RobotArmRequest :definition-)
      "float32 x
float32 y
---
uint8 result

")

(setf (get myep_bsae::RobotArmResponse :md5sum-) "ca73bd755846e340fdd096df095b3706")
(setf (get myep_bsae::RobotArmResponse :datatype-) "myep_bsae/RobotArmResponse")
(setf (get myep_bsae::RobotArmResponse :definition-)
      "float32 x
float32 y
---
uint8 result

")



(provide :myep_bsae/RobotArm "ca73bd755846e340fdd096df095b3706")


