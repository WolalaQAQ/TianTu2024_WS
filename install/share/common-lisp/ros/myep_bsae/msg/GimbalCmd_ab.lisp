; Auto-generated. Do not edit!


(cl:in-package myep_bsae-msg)


;//! \htmlinclude GimbalCmd_ab.msg.html

(cl:defclass <GimbalCmd_ab> (roslisp-msg-protocol:ros-message)
  ((pitch
    :reader pitch
    :initarg :pitch
    :type cl:integer
    :initform 0)
   (yaw
    :reader yaw
    :initarg :yaw
    :type cl:integer
    :initform 0)
   (pitch_speed
    :reader pitch_speed
    :initarg :pitch_speed
    :type cl:integer
    :initform 0)
   (yaw_speed
    :reader yaw_speed
    :initarg :yaw_speed
    :type cl:integer
    :initform 0))
)

(cl:defclass GimbalCmd_ab (<GimbalCmd_ab>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GimbalCmd_ab>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GimbalCmd_ab)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name myep_bsae-msg:<GimbalCmd_ab> is deprecated: use myep_bsae-msg:GimbalCmd_ab instead.")))

(cl:ensure-generic-function 'pitch-val :lambda-list '(m))
(cl:defmethod pitch-val ((m <GimbalCmd_ab>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myep_bsae-msg:pitch-val is deprecated.  Use myep_bsae-msg:pitch instead.")
  (pitch m))

(cl:ensure-generic-function 'yaw-val :lambda-list '(m))
(cl:defmethod yaw-val ((m <GimbalCmd_ab>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myep_bsae-msg:yaw-val is deprecated.  Use myep_bsae-msg:yaw instead.")
  (yaw m))

(cl:ensure-generic-function 'pitch_speed-val :lambda-list '(m))
(cl:defmethod pitch_speed-val ((m <GimbalCmd_ab>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myep_bsae-msg:pitch_speed-val is deprecated.  Use myep_bsae-msg:pitch_speed instead.")
  (pitch_speed m))

(cl:ensure-generic-function 'yaw_speed-val :lambda-list '(m))
(cl:defmethod yaw_speed-val ((m <GimbalCmd_ab>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myep_bsae-msg:yaw_speed-val is deprecated.  Use myep_bsae-msg:yaw_speed instead.")
  (yaw_speed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GimbalCmd_ab>) ostream)
  "Serializes a message object of type '<GimbalCmd_ab>"
  (cl:let* ((signed (cl:slot-value msg 'pitch)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'yaw)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'pitch_speed)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'yaw_speed)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GimbalCmd_ab>) istream)
  "Deserializes a message object of type '<GimbalCmd_ab>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'pitch) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'yaw) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'pitch_speed) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'yaw_speed) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GimbalCmd_ab>)))
  "Returns string type for a message object of type '<GimbalCmd_ab>"
  "myep_bsae/GimbalCmd_ab")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GimbalCmd_ab)))
  "Returns string type for a message object of type 'GimbalCmd_ab"
  "myep_bsae/GimbalCmd_ab")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GimbalCmd_ab>)))
  "Returns md5sum for a message object of type '<GimbalCmd_ab>"
  "5fcd51e279a0c28401dbfc5042b672ff")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GimbalCmd_ab)))
  "Returns md5sum for a message object of type 'GimbalCmd_ab"
  "5fcd51e279a0c28401dbfc5042b672ff")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GimbalCmd_ab>)))
  "Returns full string definition for message of type '<GimbalCmd_ab>"
  (cl:format cl:nil "int32 pitch~%int32 yaw~%int32 pitch_speed~%int32 yaw_speed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GimbalCmd_ab)))
  "Returns full string definition for message of type 'GimbalCmd_ab"
  (cl:format cl:nil "int32 pitch~%int32 yaw~%int32 pitch_speed~%int32 yaw_speed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GimbalCmd_ab>))
  (cl:+ 0
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GimbalCmd_ab>))
  "Converts a ROS message object to a list"
  (cl:list 'GimbalCmd_ab
    (cl:cons ':pitch (pitch msg))
    (cl:cons ':yaw (yaw msg))
    (cl:cons ':pitch_speed (pitch_speed msg))
    (cl:cons ':yaw_speed (yaw_speed msg))
))
