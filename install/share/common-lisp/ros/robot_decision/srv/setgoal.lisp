; Auto-generated. Do not edit!


(cl:in-package robot_decision-srv)


;//! \htmlinclude setgoal-request.msg.html

(cl:defclass <setgoal-request> (roslisp-msg-protocol:ros-message)
  ((point
    :reader point
    :initarg :point
    :type cl:integer
    :initform 0))
)

(cl:defclass setgoal-request (<setgoal-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <setgoal-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'setgoal-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_decision-srv:<setgoal-request> is deprecated: use robot_decision-srv:setgoal-request instead.")))

(cl:ensure-generic-function 'point-val :lambda-list '(m))
(cl:defmethod point-val ((m <setgoal-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_decision-srv:point-val is deprecated.  Use robot_decision-srv:point instead.")
  (point m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <setgoal-request>) ostream)
  "Serializes a message object of type '<setgoal-request>"
  (cl:let* ((signed (cl:slot-value msg 'point)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <setgoal-request>) istream)
  "Deserializes a message object of type '<setgoal-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'point) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<setgoal-request>)))
  "Returns string type for a service object of type '<setgoal-request>"
  "robot_decision/setgoalRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'setgoal-request)))
  "Returns string type for a service object of type 'setgoal-request"
  "robot_decision/setgoalRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<setgoal-request>)))
  "Returns md5sum for a message object of type '<setgoal-request>"
  "74d769a249841381656eaa787295c883")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'setgoal-request)))
  "Returns md5sum for a message object of type 'setgoal-request"
  "74d769a249841381656eaa787295c883")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<setgoal-request>)))
  "Returns full string definition for message of type '<setgoal-request>"
  (cl:format cl:nil "int32 point~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'setgoal-request)))
  "Returns full string definition for message of type 'setgoal-request"
  (cl:format cl:nil "int32 point~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <setgoal-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <setgoal-request>))
  "Converts a ROS message object to a list"
  (cl:list 'setgoal-request
    (cl:cons ':point (point msg))
))
;//! \htmlinclude setgoal-response.msg.html

(cl:defclass <setgoal-response> (roslisp-msg-protocol:ros-message)
  ((response
    :reader response
    :initarg :response
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass setgoal-response (<setgoal-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <setgoal-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'setgoal-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_decision-srv:<setgoal-response> is deprecated: use robot_decision-srv:setgoal-response instead.")))

(cl:ensure-generic-function 'response-val :lambda-list '(m))
(cl:defmethod response-val ((m <setgoal-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_decision-srv:response-val is deprecated.  Use robot_decision-srv:response instead.")
  (response m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <setgoal-response>) ostream)
  "Serializes a message object of type '<setgoal-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'response) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <setgoal-response>) istream)
  "Deserializes a message object of type '<setgoal-response>"
    (cl:setf (cl:slot-value msg 'response) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<setgoal-response>)))
  "Returns string type for a service object of type '<setgoal-response>"
  "robot_decision/setgoalResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'setgoal-response)))
  "Returns string type for a service object of type 'setgoal-response"
  "robot_decision/setgoalResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<setgoal-response>)))
  "Returns md5sum for a message object of type '<setgoal-response>"
  "74d769a249841381656eaa787295c883")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'setgoal-response)))
  "Returns md5sum for a message object of type 'setgoal-response"
  "74d769a249841381656eaa787295c883")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<setgoal-response>)))
  "Returns full string definition for message of type '<setgoal-response>"
  (cl:format cl:nil "bool response~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'setgoal-response)))
  "Returns full string definition for message of type 'setgoal-response"
  (cl:format cl:nil "bool response~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <setgoal-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <setgoal-response>))
  "Converts a ROS message object to a list"
  (cl:list 'setgoal-response
    (cl:cons ':response (response msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'setgoal)))
  'setgoal-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'setgoal)))
  'setgoal-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'setgoal)))
  "Returns string type for a service object of type '<setgoal>"
  "robot_decision/setgoal")