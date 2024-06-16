; Auto-generated. Do not edit!


(cl:in-package myep_bsae-msg)


;//! \htmlinclude GimbalCmd.msg.html

(cl:defclass <GimbalCmd> (roslisp-msg-protocol:ros-message)
  ((pitch
    :reader pitch
    :initarg :pitch
    :type cl:float
    :initform 0.0)
   (yaw
    :reader yaw
    :initarg :yaw
    :type cl:float
    :initform 0.0)
   (pitch_speed
    :reader pitch_speed
    :initarg :pitch_speed
    :type cl:float
    :initform 0.0)
   (yaw_speed
    :reader yaw_speed
    :initarg :yaw_speed
    :type cl:float
    :initform 0.0))
)

(cl:defclass GimbalCmd (<GimbalCmd>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GimbalCmd>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GimbalCmd)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name myep_bsae-msg:<GimbalCmd> is deprecated: use myep_bsae-msg:GimbalCmd instead.")))

(cl:ensure-generic-function 'pitch-val :lambda-list '(m))
(cl:defmethod pitch-val ((m <GimbalCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myep_bsae-msg:pitch-val is deprecated.  Use myep_bsae-msg:pitch instead.")
  (pitch m))

(cl:ensure-generic-function 'yaw-val :lambda-list '(m))
(cl:defmethod yaw-val ((m <GimbalCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myep_bsae-msg:yaw-val is deprecated.  Use myep_bsae-msg:yaw instead.")
  (yaw m))

(cl:ensure-generic-function 'pitch_speed-val :lambda-list '(m))
(cl:defmethod pitch_speed-val ((m <GimbalCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myep_bsae-msg:pitch_speed-val is deprecated.  Use myep_bsae-msg:pitch_speed instead.")
  (pitch_speed m))

(cl:ensure-generic-function 'yaw_speed-val :lambda-list '(m))
(cl:defmethod yaw_speed-val ((m <GimbalCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myep_bsae-msg:yaw_speed-val is deprecated.  Use myep_bsae-msg:yaw_speed instead.")
  (yaw_speed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GimbalCmd>) ostream)
  "Serializes a message object of type '<GimbalCmd>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pitch))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'yaw))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pitch_speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'yaw_speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GimbalCmd>) istream)
  "Deserializes a message object of type '<GimbalCmd>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pitch) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yaw) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pitch_speed) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yaw_speed) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GimbalCmd>)))
  "Returns string type for a message object of type '<GimbalCmd>"
  "myep_bsae/GimbalCmd")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GimbalCmd)))
  "Returns string type for a message object of type 'GimbalCmd"
  "myep_bsae/GimbalCmd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GimbalCmd>)))
  "Returns md5sum for a message object of type '<GimbalCmd>"
  "b6efcebeeaac7a8075e1a22aebb46de3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GimbalCmd)))
  "Returns md5sum for a message object of type 'GimbalCmd"
  "b6efcebeeaac7a8075e1a22aebb46de3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GimbalCmd>)))
  "Returns full string definition for message of type '<GimbalCmd>"
  (cl:format cl:nil "float32 pitch~%float32 yaw~%float32 pitch_speed~%float32 yaw_speed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GimbalCmd)))
  "Returns full string definition for message of type 'GimbalCmd"
  (cl:format cl:nil "float32 pitch~%float32 yaw~%float32 pitch_speed~%float32 yaw_speed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GimbalCmd>))
  (cl:+ 0
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GimbalCmd>))
  "Converts a ROS message object to a list"
  (cl:list 'GimbalCmd
    (cl:cons ':pitch (pitch msg))
    (cl:cons ':yaw (yaw msg))
    (cl:cons ':pitch_speed (pitch_speed msg))
    (cl:cons ':yaw_speed (yaw_speed msg))
))
