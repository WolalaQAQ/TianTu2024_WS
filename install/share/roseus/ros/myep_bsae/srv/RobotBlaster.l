;; Auto-generated. Do not edit!


(when (boundp 'myep_bsae::RobotBlaster)
  (if (not (find-package "MYEP_BSAE"))
    (make-package "MYEP_BSAE"))
  (shadow 'RobotBlaster (find-package "MYEP_BSAE")))
(unless (find-package "MYEP_BSAE::ROBOTBLASTER")
  (make-package "MYEP_BSAE::ROBOTBLASTER"))
(unless (find-package "MYEP_BSAE::ROBOTBLASTERREQUEST")
  (make-package "MYEP_BSAE::ROBOTBLASTERREQUEST"))
(unless (find-package "MYEP_BSAE::ROBOTBLASTERRESPONSE")
  (make-package "MYEP_BSAE::ROBOTBLASTERRESPONSE"))

(in-package "ROS")





(defclass myep_bsae::RobotBlasterRequest
  :super ros::object
  :slots (_type _count ))

(defmethod myep_bsae::RobotBlasterRequest
  (:init
   (&key
    ((:type __type) 0)
    ((:count __count) 0)
    )
   (send-super :init)
   (setq _type (round __type))
   (setq _count (round __count))
   self)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:count
   (&optional __count)
   (if __count (setq _count __count)) _count)
  (:serialization-length
   ()
   (+
    ;; uint8 _type
    1
    ;; uint32 _count
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _type
       (write-byte _type s)
     ;; uint32 _count
       (write-long _count s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _type
     (setq _type (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint32 _count
     (setq _count (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass myep_bsae::RobotBlasterResponse
  :super ros::object
  :slots (_result ))

(defmethod myep_bsae::RobotBlasterResponse
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

(defclass myep_bsae::RobotBlaster
  :super ros::object
  :slots ())

(setf (get myep_bsae::RobotBlaster :md5sum-) "a7120ebecfd35f623ffd5d4687655fe9")
(setf (get myep_bsae::RobotBlaster :datatype-) "myep_bsae/RobotBlaster")
(setf (get myep_bsae::RobotBlaster :request) myep_bsae::RobotBlasterRequest)
(setf (get myep_bsae::RobotBlaster :response) myep_bsae::RobotBlasterResponse)

(defmethod myep_bsae::RobotBlasterRequest
  (:response () (instance myep_bsae::RobotBlasterResponse :init)))

(setf (get myep_bsae::RobotBlasterRequest :md5sum-) "a7120ebecfd35f623ffd5d4687655fe9")
(setf (get myep_bsae::RobotBlasterRequest :datatype-) "myep_bsae/RobotBlasterRequest")
(setf (get myep_bsae::RobotBlasterRequest :definition-)
      "uint8 type
uint32 count
---
uint8 result

")

(setf (get myep_bsae::RobotBlasterResponse :md5sum-) "a7120ebecfd35f623ffd5d4687655fe9")
(setf (get myep_bsae::RobotBlasterResponse :datatype-) "myep_bsae/RobotBlasterResponse")
(setf (get myep_bsae::RobotBlasterResponse :definition-)
      "uint8 type
uint32 count
---
uint8 result

")



(provide :myep_bsae/RobotBlaster "a7120ebecfd35f623ffd5d4687655fe9")


