;; Auto-generated. Do not edit!


(when (boundp 'robot_decision::setgoal)
  (if (not (find-package "ROBOT_DECISION"))
    (make-package "ROBOT_DECISION"))
  (shadow 'setgoal (find-package "ROBOT_DECISION")))
(unless (find-package "ROBOT_DECISION::SETGOAL")
  (make-package "ROBOT_DECISION::SETGOAL"))
(unless (find-package "ROBOT_DECISION::SETGOALREQUEST")
  (make-package "ROBOT_DECISION::SETGOALREQUEST"))
(unless (find-package "ROBOT_DECISION::SETGOALRESPONSE")
  (make-package "ROBOT_DECISION::SETGOALRESPONSE"))

(in-package "ROS")





(defclass robot_decision::setgoalRequest
  :super ros::object
  :slots (_point ))

(defmethod robot_decision::setgoalRequest
  (:init
   (&key
    ((:point __point) 0)
    )
   (send-super :init)
   (setq _point (round __point))
   self)
  (:point
   (&optional __point)
   (if __point (setq _point __point)) _point)
  (:serialization-length
   ()
   (+
    ;; int32 _point
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _point
       (write-long _point s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _point
     (setq _point (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass robot_decision::setgoalResponse
  :super ros::object
  :slots (_response ))

(defmethod robot_decision::setgoalResponse
  (:init
   (&key
    ((:response __response) nil)
    )
   (send-super :init)
   (setq _response __response)
   self)
  (:response
   (&optional (__response :null))
   (if (not (eq __response :null)) (setq _response __response)) _response)
  (:serialization-length
   ()
   (+
    ;; bool _response
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _response
       (if _response (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _response
     (setq _response (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass robot_decision::setgoal
  :super ros::object
  :slots ())

(setf (get robot_decision::setgoal :md5sum-) "74d769a249841381656eaa787295c883")
(setf (get robot_decision::setgoal :datatype-) "robot_decision/setgoal")
(setf (get robot_decision::setgoal :request) robot_decision::setgoalRequest)
(setf (get robot_decision::setgoal :response) robot_decision::setgoalResponse)

(defmethod robot_decision::setgoalRequest
  (:response () (instance robot_decision::setgoalResponse :init)))

(setf (get robot_decision::setgoalRequest :md5sum-) "74d769a249841381656eaa787295c883")
(setf (get robot_decision::setgoalRequest :datatype-) "robot_decision/setgoalRequest")
(setf (get robot_decision::setgoalRequest :definition-)
      "int32 point
---
bool response
")

(setf (get robot_decision::setgoalResponse :md5sum-) "74d769a249841381656eaa787295c883")
(setf (get robot_decision::setgoalResponse :datatype-) "robot_decision/setgoalResponse")
(setf (get robot_decision::setgoalResponse :definition-)
      "int32 point
---
bool response
")



(provide :robot_decision/setgoal "74d769a249841381656eaa787295c883")


