;; Auto-generated. Do not edit!


(when (boundp 'myep_bsae::RobotGrip)
  (if (not (find-package "MYEP_BSAE"))
    (make-package "MYEP_BSAE"))
  (shadow 'RobotGrip (find-package "MYEP_BSAE")))
(unless (find-package "MYEP_BSAE::ROBOTGRIP")
  (make-package "MYEP_BSAE::ROBOTGRIP"))
(unless (find-package "MYEP_BSAE::ROBOTGRIPREQUEST")
  (make-package "MYEP_BSAE::ROBOTGRIPREQUEST"))
(unless (find-package "MYEP_BSAE::ROBOTGRIPRESPONSE")
  (make-package "MYEP_BSAE::ROBOTGRIPRESPONSE"))

(in-package "ROS")





(defclass myep_bsae::RobotGripRequest
  :super ros::object
  :slots (_state _value ))

(defmethod myep_bsae::RobotGripRequest
  (:init
   (&key
    ((:state __state) 0)
    ((:value __value) 0.0)
    )
   (send-super :init)
   (setq _state (round __state))
   (setq _value (float __value))
   self)
  (:state
   (&optional __state)
   (if __state (setq _state __state)) _state)
  (:value
   (&optional __value)
   (if __value (setq _value __value)) _value)
  (:serialization-length
   ()
   (+
    ;; uint8 _state
    1
    ;; float32 _value
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _state
       (write-byte _state s)
     ;; float32 _value
       (sys::poke _value (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _state
     (setq _state (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _value
     (setq _value (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass myep_bsae::RobotGripResponse
  :super ros::object
  :slots (_result ))

(defmethod myep_bsae::RobotGripResponse
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

(defclass myep_bsae::RobotGrip
  :super ros::object
  :slots ())

(setf (get myep_bsae::RobotGrip :md5sum-) "156b17ddf1dc4e8bbde7e72d0e8736d5")
(setf (get myep_bsae::RobotGrip :datatype-) "myep_bsae/RobotGrip")
(setf (get myep_bsae::RobotGrip :request) myep_bsae::RobotGripRequest)
(setf (get myep_bsae::RobotGrip :response) myep_bsae::RobotGripResponse)

(defmethod myep_bsae::RobotGripRequest
  (:response () (instance myep_bsae::RobotGripResponse :init)))

(setf (get myep_bsae::RobotGripRequest :md5sum-) "156b17ddf1dc4e8bbde7e72d0e8736d5")
(setf (get myep_bsae::RobotGripRequest :datatype-) "myep_bsae/RobotGripRequest")
(setf (get myep_bsae::RobotGripRequest :definition-)
      "uint8 state
float32 value
---
uint8 result

")

(setf (get myep_bsae::RobotGripResponse :md5sum-) "156b17ddf1dc4e8bbde7e72d0e8736d5")
(setf (get myep_bsae::RobotGripResponse :datatype-) "myep_bsae/RobotGripResponse")
(setf (get myep_bsae::RobotGripResponse :definition-)
      "uint8 state
float32 value
---
uint8 result

")



(provide :myep_bsae/RobotGrip "156b17ddf1dc4e8bbde7e72d0e8736d5")


