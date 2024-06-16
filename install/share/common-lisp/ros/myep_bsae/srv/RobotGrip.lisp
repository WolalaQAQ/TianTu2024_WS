; Auto-generated. Do not edit!


(cl:in-package myep_bsae-srv)


;//! \htmlinclude RobotGrip-request.msg.html

(cl:defclass <RobotGrip-request> (roslisp-msg-protocol:ros-message)
  ((state
    :reader state
    :initarg :state
    :type cl:fixnum
    :initform 0)
   (value
    :reader value
    :initarg :value
    :type cl:float
    :initform 0.0))
)

(cl:defclass RobotGrip-request (<RobotGrip-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RobotGrip-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RobotGrip-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name myep_bsae-srv:<RobotGrip-request> is deprecated: use myep_bsae-srv:RobotGrip-request instead.")))

(cl:ensure-generic-function 'state-val :lambda-list '(m))
(cl:defmethod state-val ((m <RobotGrip-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myep_bsae-srv:state-val is deprecated.  Use myep_bsae-srv:state instead.")
  (state m))

(cl:ensure-generic-function 'value-val :lambda-list '(m))
(cl:defmethod value-val ((m <RobotGrip-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myep_bsae-srv:value-val is deprecated.  Use myep_bsae-srv:value instead.")
  (value m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RobotGrip-request>) ostream)
  "Serializes a message object of type '<RobotGrip-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'state)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'value))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RobotGrip-request>) istream)
  "Deserializes a message object of type '<RobotGrip-request>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'state)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'value) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RobotGrip-request>)))
  "Returns string type for a service object of type '<RobotGrip-request>"
  "myep_bsae/RobotGripRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotGrip-request)))
  "Returns string type for a service object of type 'RobotGrip-request"
  "myep_bsae/RobotGripRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RobotGrip-request>)))
  "Returns md5sum for a message object of type '<RobotGrip-request>"
  "156b17ddf1dc4e8bbde7e72d0e8736d5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RobotGrip-request)))
  "Returns md5sum for a message object of type 'RobotGrip-request"
  "156b17ddf1dc4e8bbde7e72d0e8736d5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RobotGrip-request>)))
  "Returns full string definition for message of type '<RobotGrip-request>"
  (cl:format cl:nil "uint8 state~%float32 value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RobotGrip-request)))
  "Returns full string definition for message of type 'RobotGrip-request"
  (cl:format cl:nil "uint8 state~%float32 value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RobotGrip-request>))
  (cl:+ 0
     1
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RobotGrip-request>))
  "Converts a ROS message object to a list"
  (cl:list 'RobotGrip-request
    (cl:cons ':state (state msg))
    (cl:cons ':value (value msg))
))
;//! \htmlinclude RobotGrip-response.msg.html

(cl:defclass <RobotGrip-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:fixnum
    :initform 0))
)

(cl:defclass RobotGrip-response (<RobotGrip-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RobotGrip-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RobotGrip-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name myep_bsae-srv:<RobotGrip-response> is deprecated: use myep_bsae-srv:RobotGrip-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <RobotGrip-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myep_bsae-srv:result-val is deprecated.  Use myep_bsae-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RobotGrip-response>) ostream)
  "Serializes a message object of type '<RobotGrip-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'result)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RobotGrip-response>) istream)
  "Deserializes a message object of type '<RobotGrip-response>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'result)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RobotGrip-response>)))
  "Returns string type for a service object of type '<RobotGrip-response>"
  "myep_bsae/RobotGripResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotGrip-response)))
  "Returns string type for a service object of type 'RobotGrip-response"
  "myep_bsae/RobotGripResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RobotGrip-response>)))
  "Returns md5sum for a message object of type '<RobotGrip-response>"
  "156b17ddf1dc4e8bbde7e72d0e8736d5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RobotGrip-response)))
  "Returns md5sum for a message object of type 'RobotGrip-response"
  "156b17ddf1dc4e8bbde7e72d0e8736d5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RobotGrip-response>)))
  "Returns full string definition for message of type '<RobotGrip-response>"
  (cl:format cl:nil "uint8 result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RobotGrip-response)))
  "Returns full string definition for message of type 'RobotGrip-response"
  (cl:format cl:nil "uint8 result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RobotGrip-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RobotGrip-response>))
  "Converts a ROS message object to a list"
  (cl:list 'RobotGrip-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'RobotGrip)))
  'RobotGrip-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'RobotGrip)))
  'RobotGrip-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotGrip)))
  "Returns string type for a service object of type '<RobotGrip>"
  "myep_bsae/RobotGrip")