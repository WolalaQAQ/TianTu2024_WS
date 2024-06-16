; Auto-generated. Do not edit!


(cl:in-package myep_bsae-srv)


;//! \htmlinclude RobotPwm-request.msg.html

(cl:defclass <RobotPwm-request> (roslisp-msg-protocol:ros-message)
  ((pwm1_freq
    :reader pwm1_freq
    :initarg :pwm1_freq
    :type cl:float
    :initform 0.0)
   (pwm1_value
    :reader pwm1_value
    :initarg :pwm1_value
    :type cl:float
    :initform 0.0)
   (pwm2_freq
    :reader pwm2_freq
    :initarg :pwm2_freq
    :type cl:float
    :initform 0.0)
   (pwm2_value
    :reader pwm2_value
    :initarg :pwm2_value
    :type cl:float
    :initform 0.0)
   (pwm3_freq
    :reader pwm3_freq
    :initarg :pwm3_freq
    :type cl:float
    :initform 0.0)
   (pwm3_value
    :reader pwm3_value
    :initarg :pwm3_value
    :type cl:float
    :initform 0.0)
   (pwm4_freq
    :reader pwm4_freq
    :initarg :pwm4_freq
    :type cl:float
    :initform 0.0)
   (pwm4_value
    :reader pwm4_value
    :initarg :pwm4_value
    :type cl:float
    :initform 0.0)
   (pwm5_freq
    :reader pwm5_freq
    :initarg :pwm5_freq
    :type cl:float
    :initform 0.0)
   (pwm5_value
    :reader pwm5_value
    :initarg :pwm5_value
    :type cl:float
    :initform 0.0)
   (pwm6_freq
    :reader pwm6_freq
    :initarg :pwm6_freq
    :type cl:float
    :initform 0.0)
   (pwm6_value
    :reader pwm6_value
    :initarg :pwm6_value
    :type cl:float
    :initform 0.0))
)

(cl:defclass RobotPwm-request (<RobotPwm-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RobotPwm-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RobotPwm-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name myep_bsae-srv:<RobotPwm-request> is deprecated: use myep_bsae-srv:RobotPwm-request instead.")))

(cl:ensure-generic-function 'pwm1_freq-val :lambda-list '(m))
(cl:defmethod pwm1_freq-val ((m <RobotPwm-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myep_bsae-srv:pwm1_freq-val is deprecated.  Use myep_bsae-srv:pwm1_freq instead.")
  (pwm1_freq m))

(cl:ensure-generic-function 'pwm1_value-val :lambda-list '(m))
(cl:defmethod pwm1_value-val ((m <RobotPwm-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myep_bsae-srv:pwm1_value-val is deprecated.  Use myep_bsae-srv:pwm1_value instead.")
  (pwm1_value m))

(cl:ensure-generic-function 'pwm2_freq-val :lambda-list '(m))
(cl:defmethod pwm2_freq-val ((m <RobotPwm-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myep_bsae-srv:pwm2_freq-val is deprecated.  Use myep_bsae-srv:pwm2_freq instead.")
  (pwm2_freq m))

(cl:ensure-generic-function 'pwm2_value-val :lambda-list '(m))
(cl:defmethod pwm2_value-val ((m <RobotPwm-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myep_bsae-srv:pwm2_value-val is deprecated.  Use myep_bsae-srv:pwm2_value instead.")
  (pwm2_value m))

(cl:ensure-generic-function 'pwm3_freq-val :lambda-list '(m))
(cl:defmethod pwm3_freq-val ((m <RobotPwm-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myep_bsae-srv:pwm3_freq-val is deprecated.  Use myep_bsae-srv:pwm3_freq instead.")
  (pwm3_freq m))

(cl:ensure-generic-function 'pwm3_value-val :lambda-list '(m))
(cl:defmethod pwm3_value-val ((m <RobotPwm-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myep_bsae-srv:pwm3_value-val is deprecated.  Use myep_bsae-srv:pwm3_value instead.")
  (pwm3_value m))

(cl:ensure-generic-function 'pwm4_freq-val :lambda-list '(m))
(cl:defmethod pwm4_freq-val ((m <RobotPwm-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myep_bsae-srv:pwm4_freq-val is deprecated.  Use myep_bsae-srv:pwm4_freq instead.")
  (pwm4_freq m))

(cl:ensure-generic-function 'pwm4_value-val :lambda-list '(m))
(cl:defmethod pwm4_value-val ((m <RobotPwm-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myep_bsae-srv:pwm4_value-val is deprecated.  Use myep_bsae-srv:pwm4_value instead.")
  (pwm4_value m))

(cl:ensure-generic-function 'pwm5_freq-val :lambda-list '(m))
(cl:defmethod pwm5_freq-val ((m <RobotPwm-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myep_bsae-srv:pwm5_freq-val is deprecated.  Use myep_bsae-srv:pwm5_freq instead.")
  (pwm5_freq m))

(cl:ensure-generic-function 'pwm5_value-val :lambda-list '(m))
(cl:defmethod pwm5_value-val ((m <RobotPwm-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myep_bsae-srv:pwm5_value-val is deprecated.  Use myep_bsae-srv:pwm5_value instead.")
  (pwm5_value m))

(cl:ensure-generic-function 'pwm6_freq-val :lambda-list '(m))
(cl:defmethod pwm6_freq-val ((m <RobotPwm-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myep_bsae-srv:pwm6_freq-val is deprecated.  Use myep_bsae-srv:pwm6_freq instead.")
  (pwm6_freq m))

(cl:ensure-generic-function 'pwm6_value-val :lambda-list '(m))
(cl:defmethod pwm6_value-val ((m <RobotPwm-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myep_bsae-srv:pwm6_value-val is deprecated.  Use myep_bsae-srv:pwm6_value instead.")
  (pwm6_value m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RobotPwm-request>) ostream)
  "Serializes a message object of type '<RobotPwm-request>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pwm1_freq))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pwm1_value))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pwm2_freq))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pwm2_value))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pwm3_freq))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pwm3_value))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pwm4_freq))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pwm4_value))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pwm5_freq))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pwm5_value))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pwm6_freq))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pwm6_value))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RobotPwm-request>) istream)
  "Deserializes a message object of type '<RobotPwm-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pwm1_freq) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pwm1_value) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pwm2_freq) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pwm2_value) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pwm3_freq) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pwm3_value) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pwm4_freq) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pwm4_value) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pwm5_freq) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pwm5_value) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pwm6_freq) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pwm6_value) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RobotPwm-request>)))
  "Returns string type for a service object of type '<RobotPwm-request>"
  "myep_bsae/RobotPwmRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotPwm-request)))
  "Returns string type for a service object of type 'RobotPwm-request"
  "myep_bsae/RobotPwmRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RobotPwm-request>)))
  "Returns md5sum for a message object of type '<RobotPwm-request>"
  "6c239c834ae059903d50c5af0762999e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RobotPwm-request)))
  "Returns md5sum for a message object of type 'RobotPwm-request"
  "6c239c834ae059903d50c5af0762999e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RobotPwm-request>)))
  "Returns full string definition for message of type '<RobotPwm-request>"
  (cl:format cl:nil "float32 pwm1_freq~%float32 pwm1_value~%float32 pwm2_freq~%float32 pwm2_value~%float32 pwm3_freq~%float32 pwm3_value~%float32 pwm4_freq~%float32 pwm4_value~%float32 pwm5_freq~%float32 pwm5_value~%float32 pwm6_freq~%float32 pwm6_value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RobotPwm-request)))
  "Returns full string definition for message of type 'RobotPwm-request"
  (cl:format cl:nil "float32 pwm1_freq~%float32 pwm1_value~%float32 pwm2_freq~%float32 pwm2_value~%float32 pwm3_freq~%float32 pwm3_value~%float32 pwm4_freq~%float32 pwm4_value~%float32 pwm5_freq~%float32 pwm5_value~%float32 pwm6_freq~%float32 pwm6_value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RobotPwm-request>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RobotPwm-request>))
  "Converts a ROS message object to a list"
  (cl:list 'RobotPwm-request
    (cl:cons ':pwm1_freq (pwm1_freq msg))
    (cl:cons ':pwm1_value (pwm1_value msg))
    (cl:cons ':pwm2_freq (pwm2_freq msg))
    (cl:cons ':pwm2_value (pwm2_value msg))
    (cl:cons ':pwm3_freq (pwm3_freq msg))
    (cl:cons ':pwm3_value (pwm3_value msg))
    (cl:cons ':pwm4_freq (pwm4_freq msg))
    (cl:cons ':pwm4_value (pwm4_value msg))
    (cl:cons ':pwm5_freq (pwm5_freq msg))
    (cl:cons ':pwm5_value (pwm5_value msg))
    (cl:cons ':pwm6_freq (pwm6_freq msg))
    (cl:cons ':pwm6_value (pwm6_value msg))
))
;//! \htmlinclude RobotPwm-response.msg.html

(cl:defclass <RobotPwm-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:fixnum
    :initform 0))
)

(cl:defclass RobotPwm-response (<RobotPwm-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RobotPwm-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RobotPwm-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name myep_bsae-srv:<RobotPwm-response> is deprecated: use myep_bsae-srv:RobotPwm-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <RobotPwm-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myep_bsae-srv:result-val is deprecated.  Use myep_bsae-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RobotPwm-response>) ostream)
  "Serializes a message object of type '<RobotPwm-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'result)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RobotPwm-response>) istream)
  "Deserializes a message object of type '<RobotPwm-response>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'result)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RobotPwm-response>)))
  "Returns string type for a service object of type '<RobotPwm-response>"
  "myep_bsae/RobotPwmResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotPwm-response)))
  "Returns string type for a service object of type 'RobotPwm-response"
  "myep_bsae/RobotPwmResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RobotPwm-response>)))
  "Returns md5sum for a message object of type '<RobotPwm-response>"
  "6c239c834ae059903d50c5af0762999e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RobotPwm-response)))
  "Returns md5sum for a message object of type 'RobotPwm-response"
  "6c239c834ae059903d50c5af0762999e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RobotPwm-response>)))
  "Returns full string definition for message of type '<RobotPwm-response>"
  (cl:format cl:nil "uint8 result~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RobotPwm-response)))
  "Returns full string definition for message of type 'RobotPwm-response"
  (cl:format cl:nil "uint8 result~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RobotPwm-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RobotPwm-response>))
  "Converts a ROS message object to a list"
  (cl:list 'RobotPwm-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'RobotPwm)))
  'RobotPwm-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'RobotPwm)))
  'RobotPwm-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotPwm)))
  "Returns string type for a service object of type '<RobotPwm>"
  "myep_bsae/RobotPwm")