; Auto-generated. Do not edit!


(cl:in-package myep_bsae-srv)


;//! \htmlinclude RobotBlaster-request.msg.html

(cl:defclass <RobotBlaster-request> (roslisp-msg-protocol:ros-message)
  ((type
    :reader type
    :initarg :type
    :type cl:fixnum
    :initform 0)
   (count
    :reader count
    :initarg :count
    :type cl:integer
    :initform 0))
)

(cl:defclass RobotBlaster-request (<RobotBlaster-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RobotBlaster-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RobotBlaster-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name myep_bsae-srv:<RobotBlaster-request> is deprecated: use myep_bsae-srv:RobotBlaster-request instead.")))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <RobotBlaster-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myep_bsae-srv:type-val is deprecated.  Use myep_bsae-srv:type instead.")
  (type m))

(cl:ensure-generic-function 'count-val :lambda-list '(m))
(cl:defmethod count-val ((m <RobotBlaster-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myep_bsae-srv:count-val is deprecated.  Use myep_bsae-srv:count instead.")
  (count m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RobotBlaster-request>) ostream)
  "Serializes a message object of type '<RobotBlaster-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'type)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'count)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'count)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'count)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'count)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RobotBlaster-request>) istream)
  "Deserializes a message object of type '<RobotBlaster-request>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'type)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'count)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'count)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'count)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'count)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RobotBlaster-request>)))
  "Returns string type for a service object of type '<RobotBlaster-request>"
  "myep_bsae/RobotBlasterRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotBlaster-request)))
  "Returns string type for a service object of type 'RobotBlaster-request"
  "myep_bsae/RobotBlasterRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RobotBlaster-request>)))
  "Returns md5sum for a message object of type '<RobotBlaster-request>"
  "a7120ebecfd35f623ffd5d4687655fe9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RobotBlaster-request)))
  "Returns md5sum for a message object of type 'RobotBlaster-request"
  "a7120ebecfd35f623ffd5d4687655fe9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RobotBlaster-request>)))
  "Returns full string definition for message of type '<RobotBlaster-request>"
  (cl:format cl:nil "uint8 type~%uint32 count~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RobotBlaster-request)))
  "Returns full string definition for message of type 'RobotBlaster-request"
  (cl:format cl:nil "uint8 type~%uint32 count~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RobotBlaster-request>))
  (cl:+ 0
     1
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RobotBlaster-request>))
  "Converts a ROS message object to a list"
  (cl:list 'RobotBlaster-request
    (cl:cons ':type (type msg))
    (cl:cons ':count (count msg))
))
;//! \htmlinclude RobotBlaster-response.msg.html

(cl:defclass <RobotBlaster-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:fixnum
    :initform 0))
)

(cl:defclass RobotBlaster-response (<RobotBlaster-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RobotBlaster-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RobotBlaster-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name myep_bsae-srv:<RobotBlaster-response> is deprecated: use myep_bsae-srv:RobotBlaster-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <RobotBlaster-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myep_bsae-srv:result-val is deprecated.  Use myep_bsae-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RobotBlaster-response>) ostream)
  "Serializes a message object of type '<RobotBlaster-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'result)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RobotBlaster-response>) istream)
  "Deserializes a message object of type '<RobotBlaster-response>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'result)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RobotBlaster-response>)))
  "Returns string type for a service object of type '<RobotBlaster-response>"
  "myep_bsae/RobotBlasterResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotBlaster-response)))
  "Returns string type for a service object of type 'RobotBlaster-response"
  "myep_bsae/RobotBlasterResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RobotBlaster-response>)))
  "Returns md5sum for a message object of type '<RobotBlaster-response>"
  "a7120ebecfd35f623ffd5d4687655fe9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RobotBlaster-response)))
  "Returns md5sum for a message object of type 'RobotBlaster-response"
  "a7120ebecfd35f623ffd5d4687655fe9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RobotBlaster-response>)))
  "Returns full string definition for message of type '<RobotBlaster-response>"
  (cl:format cl:nil "uint8 result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RobotBlaster-response)))
  "Returns full string definition for message of type 'RobotBlaster-response"
  (cl:format cl:nil "uint8 result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RobotBlaster-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RobotBlaster-response>))
  "Converts a ROS message object to a list"
  (cl:list 'RobotBlaster-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'RobotBlaster)))
  'RobotBlaster-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'RobotBlaster)))
  'RobotBlaster-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotBlaster)))
  "Returns string type for a service object of type '<RobotBlaster>"
  "myep_bsae/RobotBlaster")