;; Auto-generated. Do not edit!


(when (boundp 'myep_bsae::GimbalCmd_ab)
  (if (not (find-package "MYEP_BSAE"))
    (make-package "MYEP_BSAE"))
  (shadow 'GimbalCmd_ab (find-package "MYEP_BSAE")))
(unless (find-package "MYEP_BSAE::GIMBALCMD_AB")
  (make-package "MYEP_BSAE::GIMBALCMD_AB"))

(in-package "ROS")
;;//! \htmlinclude GimbalCmd_ab.msg.html


(defclass myep_bsae::GimbalCmd_ab
  :super ros::object
  :slots (_pitch _yaw _pitch_speed _yaw_speed ))

(defmethod myep_bsae::GimbalCmd_ab
  (:init
   (&key
    ((:pitch __pitch) 0)
    ((:yaw __yaw) 0)
    ((:pitch_speed __pitch_speed) 0)
    ((:yaw_speed __yaw_speed) 0)
    )
   (send-super :init)
   (setq _pitch (round __pitch))
   (setq _yaw (round __yaw))
   (setq _pitch_speed (round __pitch_speed))
   (setq _yaw_speed (round __yaw_speed))
   self)
  (:pitch
   (&optional __pitch)
   (if __pitch (setq _pitch __pitch)) _pitch)
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:pitch_speed
   (&optional __pitch_speed)
   (if __pitch_speed (setq _pitch_speed __pitch_speed)) _pitch_speed)
  (:yaw_speed
   (&optional __yaw_speed)
   (if __yaw_speed (setq _yaw_speed __yaw_speed)) _yaw_speed)
  (:serialization-length
   ()
   (+
    ;; int32 _pitch
    4
    ;; int32 _yaw
    4
    ;; int32 _pitch_speed
    4
    ;; int32 _yaw_speed
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _pitch
       (write-long _pitch s)
     ;; int32 _yaw
       (write-long _yaw s)
     ;; int32 _pitch_speed
       (write-long _pitch_speed s)
     ;; int32 _yaw_speed
       (write-long _yaw_speed s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _pitch
     (setq _pitch (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _yaw
     (setq _yaw (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _pitch_speed
     (setq _pitch_speed (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _yaw_speed
     (setq _yaw_speed (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get myep_bsae::GimbalCmd_ab :md5sum-) "5fcd51e279a0c28401dbfc5042b672ff")
(setf (get myep_bsae::GimbalCmd_ab :datatype-) "myep_bsae/GimbalCmd_ab")
(setf (get myep_bsae::GimbalCmd_ab :definition-)
      "int32 pitch
int32 yaw
int32 pitch_speed
int32 yaw_speed

")



(provide :myep_bsae/GimbalCmd_ab "5fcd51e279a0c28401dbfc5042b672ff")


