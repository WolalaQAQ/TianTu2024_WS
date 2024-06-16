; Auto-generated. Do not edit!


(cl:in-package myep_bsae-msg)


;//! \htmlinclude GimbalFdb.msg.html

(cl:defclass <GimbalFdb> (roslisp-msg-protocol:ros-message)
  ((stamp
    :reader stamp
    :initarg :stamp
    :type cl:real
    :initform 0)
   (pitch_angle_fdb
    :reader pitch_angle_fdb
    :initarg :pitch_angle_fdb
    :type cl:float
    :initform 0.0)
   (yaw_angle_fdb
    :reader yaw_angle_fdb
    :initarg :yaw_angle_fdb
    :type cl:float
    :initform 0.0)
   (pitch_ground_angle_fdb
    :reader pitch_ground_angle_fdb
    :initarg :pitch_ground_angle_fdb
    :type cl:float
    :initform 0.0)
   (yaw_ground_angle_fdb
    :reader yaw_ground_angle_fdb
    :initarg :yaw_ground_angle_fdb
    :type cl:float
    :initform 0.0))
)

(cl:defclass GimbalFdb (<GimbalFdb>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GimbalFdb>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GimbalFdb)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name myep_bsae-msg:<GimbalFdb> is deprecated: use myep_bsae-msg:GimbalFdb instead.")))

(cl:ensure-generic-function 'stamp-val :lambda-list '(m))
(cl:defmethod stamp-val ((m <GimbalFdb>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myep_bsae-msg:stamp-val is deprecated.  Use myep_bsae-msg:stamp instead.")
  (stamp m))

(cl:ensure-generic-function 'pitch_angle_fdb-val :lambda-list '(m))
(cl:defmethod pitch_angle_fdb-val ((m <GimbalFdb>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myep_bsae-msg:pitch_angle_fdb-val is deprecated.  Use myep_bsae-msg:pitch_angle_fdb instead.")
  (pitch_angle_fdb m))

(cl:ensure-generic-function 'yaw_angle_fdb-val :lambda-list '(m))
(cl:defmethod yaw_angle_fdb-val ((m <GimbalFdb>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myep_bsae-msg:yaw_angle_fdb-val is deprecated.  Use myep_bsae-msg:yaw_angle_fdb instead.")
  (yaw_angle_fdb m))

(cl:ensure-generic-function 'pitch_ground_angle_fdb-val :lambda-list '(m))
(cl:defmethod pitch_ground_angle_fdb-val ((m <GimbalFdb>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myep_bsae-msg:pitch_ground_angle_fdb-val is deprecated.  Use myep_bsae-msg:pitch_ground_angle_fdb instead.")
  (pitch_ground_angle_fdb m))

(cl:ensure-generic-function 'yaw_ground_angle_fdb-val :lambda-list '(m))
(cl:defmethod yaw_ground_angle_fdb-val ((m <GimbalFdb>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myep_bsae-msg:yaw_ground_angle_fdb-val is deprecated.  Use myep_bsae-msg:yaw_ground_angle_fdb instead.")
  (yaw_ground_angle_fdb m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GimbalFdb>) ostream)
  "Serializes a message object of type '<GimbalFdb>"
  (cl:let ((__sec (cl:floor (cl:slot-value msg 'stamp)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 'stamp) (cl:floor (cl:slot-value msg 'stamp)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pitch_angle_fdb))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'yaw_angle_fdb))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pitch_ground_angle_fdb))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'yaw_ground_angle_fdb))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GimbalFdb>) istream)
  "Deserializes a message object of type '<GimbalFdb>"
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'stamp) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pitch_angle_fdb) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yaw_angle_fdb) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pitch_ground_angle_fdb) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yaw_ground_angle_fdb) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GimbalFdb>)))
  "Returns string type for a message object of type '<GimbalFdb>"
  "myep_bsae/GimbalFdb")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GimbalFdb)))
  "Returns string type for a message object of type 'GimbalFdb"
  "myep_bsae/GimbalFdb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GimbalFdb>)))
  "Returns md5sum for a message object of type '<GimbalFdb>"
  "4baddb8bc789a9d0d6c754f66cd82965")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GimbalFdb)))
  "Returns md5sum for a message object of type 'GimbalFdb"
  "4baddb8bc789a9d0d6c754f66cd82965")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GimbalFdb>)))
  "Returns full string definition for message of type '<GimbalFdb>"
  (cl:format cl:nil "time stamp~%float32 pitch_angle_fdb~%float32 yaw_angle_fdb~%float32 pitch_ground_angle_fdb~%float32 yaw_ground_angle_fdb~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GimbalFdb)))
  "Returns full string definition for message of type 'GimbalFdb"
  (cl:format cl:nil "time stamp~%float32 pitch_angle_fdb~%float32 yaw_angle_fdb~%float32 pitch_ground_angle_fdb~%float32 yaw_ground_angle_fdb~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GimbalFdb>))
  (cl:+ 0
     8
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GimbalFdb>))
  "Converts a ROS message object to a list"
  (cl:list 'GimbalFdb
    (cl:cons ':stamp (stamp msg))
    (cl:cons ':pitch_angle_fdb (pitch_angle_fdb msg))
    (cl:cons ':yaw_angle_fdb (yaw_angle_fdb msg))
    (cl:cons ':pitch_ground_angle_fdb (pitch_ground_angle_fdb msg))
    (cl:cons ':yaw_ground_angle_fdb (yaw_ground_angle_fdb msg))
))
