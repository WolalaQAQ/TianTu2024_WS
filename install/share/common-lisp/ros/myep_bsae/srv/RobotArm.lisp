; Auto-generated. Do not edit!


(cl:in-package myep_bsae-srv)


;//! \htmlinclude RobotArm-request.msg.html

(cl:defclass <RobotArm-request> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0))
)

(cl:defclass RobotArm-request (<RobotArm-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RobotArm-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RobotArm-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name myep_bsae-srv:<RobotArm-request> is deprecated: use myep_bsae-srv:RobotArm-request instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <RobotArm-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myep_bsae-srv:x-val is deprecated.  Use myep_bsae-srv:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <RobotArm-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myep_bsae-srv:y-val is deprecated.  Use myep_bsae-srv:y instead.")
  (y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RobotArm-request>) ostream)
  "Serializes a message object of type '<RobotArm-request>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RobotArm-request>) istream)
  "Deserializes a message object of type '<RobotArm-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RobotArm-request>)))
  "Returns string type for a service object of type '<RobotArm-request>"
  "myep_bsae/RobotArmRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotArm-request)))
  "Returns string type for a service object of type 'RobotArm-request"
  "myep_bsae/RobotArmRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RobotArm-request>)))
  "Returns md5sum for a message object of type '<RobotArm-request>"
  "ca73bd755846e340fdd096df095b3706")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RobotArm-request)))
  "Returns md5sum for a message object of type 'RobotArm-request"
  "ca73bd755846e340fdd096df095b3706")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RobotArm-request>)))
  "Returns full string definition for message of type '<RobotArm-request>"
  (cl:format cl:nil "float32 x~%float32 y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RobotArm-request)))
  "Returns full string definition for message of type 'RobotArm-request"
  (cl:format cl:nil "float32 x~%float32 y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RobotArm-request>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RobotArm-request>))
  "Converts a ROS message object to a list"
  (cl:list 'RobotArm-request
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
))
;//! \htmlinclude RobotArm-response.msg.html

(cl:defclass <RobotArm-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:fixnum
    :initform 0))
)

(cl:defclass RobotArm-response (<RobotArm-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RobotArm-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RobotArm-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name myep_bsae-srv:<RobotArm-response> is deprecated: use myep_bsae-srv:RobotArm-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <RobotArm-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myep_bsae-srv:result-val is deprecated.  Use myep_bsae-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RobotArm-response>) ostream)
  "Serializes a message object of type '<RobotArm-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'result)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RobotArm-response>) istream)
  "Deserializes a message object of type '<RobotArm-response>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'result)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RobotArm-response>)))
  "Returns string type for a service object of type '<RobotArm-response>"
  "myep_bsae/RobotArmResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotArm-response)))
  "Returns string type for a service object of type 'RobotArm-response"
  "myep_bsae/RobotArmResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RobotArm-response>)))
  "Returns md5sum for a message object of type '<RobotArm-response>"
  "ca73bd755846e340fdd096df095b3706")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RobotArm-response)))
  "Returns md5sum for a message object of type 'RobotArm-response"
  "ca73bd755846e340fdd096df095b3706")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RobotArm-response>)))
  "Returns full string definition for message of type '<RobotArm-response>"
  (cl:format cl:nil "uint8 result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RobotArm-response)))
  "Returns full string definition for message of type 'RobotArm-response"
  (cl:format cl:nil "uint8 result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RobotArm-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RobotArm-response>))
  "Converts a ROS message object to a list"
  (cl:list 'RobotArm-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'RobotArm)))
  'RobotArm-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'RobotArm)))
  'RobotArm-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotArm)))
  "Returns string type for a service object of type '<RobotArm>"
  "myep_bsae/RobotArm")