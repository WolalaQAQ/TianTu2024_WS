// Auto-generated. Do not edit!

// (in-package myep_bsae.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class RobotPwmRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.pwm1_freq = null;
      this.pwm1_value = null;
      this.pwm2_freq = null;
      this.pwm2_value = null;
      this.pwm3_freq = null;
      this.pwm3_value = null;
      this.pwm4_freq = null;
      this.pwm4_value = null;
      this.pwm5_freq = null;
      this.pwm5_value = null;
      this.pwm6_freq = null;
      this.pwm6_value = null;
    }
    else {
      if (initObj.hasOwnProperty('pwm1_freq')) {
        this.pwm1_freq = initObj.pwm1_freq
      }
      else {
        this.pwm1_freq = 0.0;
      }
      if (initObj.hasOwnProperty('pwm1_value')) {
        this.pwm1_value = initObj.pwm1_value
      }
      else {
        this.pwm1_value = 0.0;
      }
      if (initObj.hasOwnProperty('pwm2_freq')) {
        this.pwm2_freq = initObj.pwm2_freq
      }
      else {
        this.pwm2_freq = 0.0;
      }
      if (initObj.hasOwnProperty('pwm2_value')) {
        this.pwm2_value = initObj.pwm2_value
      }
      else {
        this.pwm2_value = 0.0;
      }
      if (initObj.hasOwnProperty('pwm3_freq')) {
        this.pwm3_freq = initObj.pwm3_freq
      }
      else {
        this.pwm3_freq = 0.0;
      }
      if (initObj.hasOwnProperty('pwm3_value')) {
        this.pwm3_value = initObj.pwm3_value
      }
      else {
        this.pwm3_value = 0.0;
      }
      if (initObj.hasOwnProperty('pwm4_freq')) {
        this.pwm4_freq = initObj.pwm4_freq
      }
      else {
        this.pwm4_freq = 0.0;
      }
      if (initObj.hasOwnProperty('pwm4_value')) {
        this.pwm4_value = initObj.pwm4_value
      }
      else {
        this.pwm4_value = 0.0;
      }
      if (initObj.hasOwnProperty('pwm5_freq')) {
        this.pwm5_freq = initObj.pwm5_freq
      }
      else {
        this.pwm5_freq = 0.0;
      }
      if (initObj.hasOwnProperty('pwm5_value')) {
        this.pwm5_value = initObj.pwm5_value
      }
      else {
        this.pwm5_value = 0.0;
      }
      if (initObj.hasOwnProperty('pwm6_freq')) {
        this.pwm6_freq = initObj.pwm6_freq
      }
      else {
        this.pwm6_freq = 0.0;
      }
      if (initObj.hasOwnProperty('pwm6_value')) {
        this.pwm6_value = initObj.pwm6_value
      }
      else {
        this.pwm6_value = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RobotPwmRequest
    // Serialize message field [pwm1_freq]
    bufferOffset = _serializer.float32(obj.pwm1_freq, buffer, bufferOffset);
    // Serialize message field [pwm1_value]
    bufferOffset = _serializer.float32(obj.pwm1_value, buffer, bufferOffset);
    // Serialize message field [pwm2_freq]
    bufferOffset = _serializer.float32(obj.pwm2_freq, buffer, bufferOffset);
    // Serialize message field [pwm2_value]
    bufferOffset = _serializer.float32(obj.pwm2_value, buffer, bufferOffset);
    // Serialize message field [pwm3_freq]
    bufferOffset = _serializer.float32(obj.pwm3_freq, buffer, bufferOffset);
    // Serialize message field [pwm3_value]
    bufferOffset = _serializer.float32(obj.pwm3_value, buffer, bufferOffset);
    // Serialize message field [pwm4_freq]
    bufferOffset = _serializer.float32(obj.pwm4_freq, buffer, bufferOffset);
    // Serialize message field [pwm4_value]
    bufferOffset = _serializer.float32(obj.pwm4_value, buffer, bufferOffset);
    // Serialize message field [pwm5_freq]
    bufferOffset = _serializer.float32(obj.pwm5_freq, buffer, bufferOffset);
    // Serialize message field [pwm5_value]
    bufferOffset = _serializer.float32(obj.pwm5_value, buffer, bufferOffset);
    // Serialize message field [pwm6_freq]
    bufferOffset = _serializer.float32(obj.pwm6_freq, buffer, bufferOffset);
    // Serialize message field [pwm6_value]
    bufferOffset = _serializer.float32(obj.pwm6_value, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RobotPwmRequest
    let len;
    let data = new RobotPwmRequest(null);
    // Deserialize message field [pwm1_freq]
    data.pwm1_freq = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [pwm1_value]
    data.pwm1_value = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [pwm2_freq]
    data.pwm2_freq = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [pwm2_value]
    data.pwm2_value = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [pwm3_freq]
    data.pwm3_freq = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [pwm3_value]
    data.pwm3_value = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [pwm4_freq]
    data.pwm4_freq = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [pwm4_value]
    data.pwm4_value = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [pwm5_freq]
    data.pwm5_freq = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [pwm5_value]
    data.pwm5_value = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [pwm6_freq]
    data.pwm6_freq = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [pwm6_value]
    data.pwm6_value = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 48;
  }

  static datatype() {
    // Returns string type for a service object
    return 'myep_bsae/RobotPwmRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd2ed9194cde38921e6036eaa7a286dad';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 pwm1_freq
    float32 pwm1_value
    float32 pwm2_freq
    float32 pwm2_value
    float32 pwm3_freq
    float32 pwm3_value
    float32 pwm4_freq
    float32 pwm4_value
    float32 pwm5_freq
    float32 pwm5_value
    float32 pwm6_freq
    float32 pwm6_value
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RobotPwmRequest(null);
    if (msg.pwm1_freq !== undefined) {
      resolved.pwm1_freq = msg.pwm1_freq;
    }
    else {
      resolved.pwm1_freq = 0.0
    }

    if (msg.pwm1_value !== undefined) {
      resolved.pwm1_value = msg.pwm1_value;
    }
    else {
      resolved.pwm1_value = 0.0
    }

    if (msg.pwm2_freq !== undefined) {
      resolved.pwm2_freq = msg.pwm2_freq;
    }
    else {
      resolved.pwm2_freq = 0.0
    }

    if (msg.pwm2_value !== undefined) {
      resolved.pwm2_value = msg.pwm2_value;
    }
    else {
      resolved.pwm2_value = 0.0
    }

    if (msg.pwm3_freq !== undefined) {
      resolved.pwm3_freq = msg.pwm3_freq;
    }
    else {
      resolved.pwm3_freq = 0.0
    }

    if (msg.pwm3_value !== undefined) {
      resolved.pwm3_value = msg.pwm3_value;
    }
    else {
      resolved.pwm3_value = 0.0
    }

    if (msg.pwm4_freq !== undefined) {
      resolved.pwm4_freq = msg.pwm4_freq;
    }
    else {
      resolved.pwm4_freq = 0.0
    }

    if (msg.pwm4_value !== undefined) {
      resolved.pwm4_value = msg.pwm4_value;
    }
    else {
      resolved.pwm4_value = 0.0
    }

    if (msg.pwm5_freq !== undefined) {
      resolved.pwm5_freq = msg.pwm5_freq;
    }
    else {
      resolved.pwm5_freq = 0.0
    }

    if (msg.pwm5_value !== undefined) {
      resolved.pwm5_value = msg.pwm5_value;
    }
    else {
      resolved.pwm5_value = 0.0
    }

    if (msg.pwm6_freq !== undefined) {
      resolved.pwm6_freq = msg.pwm6_freq;
    }
    else {
      resolved.pwm6_freq = 0.0
    }

    if (msg.pwm6_value !== undefined) {
      resolved.pwm6_value = msg.pwm6_value;
    }
    else {
      resolved.pwm6_value = 0.0
    }

    return resolved;
    }
};

class RobotPwmResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.result = null;
    }
    else {
      if (initObj.hasOwnProperty('result')) {
        this.result = initObj.result
      }
      else {
        this.result = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RobotPwmResponse
    // Serialize message field [result]
    bufferOffset = _serializer.uint8(obj.result, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RobotPwmResponse
    let len;
    let data = new RobotPwmResponse(null);
    // Deserialize message field [result]
    data.result = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'myep_bsae/RobotPwmResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '25458147911545c320c4c0a299eff763';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 result
    
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RobotPwmResponse(null);
    if (msg.result !== undefined) {
      resolved.result = msg.result;
    }
    else {
      resolved.result = 0
    }

    return resolved;
    }
};

module.exports = {
  Request: RobotPwmRequest,
  Response: RobotPwmResponse,
  md5sum() { return '6c239c834ae059903d50c5af0762999e'; },
  datatype() { return 'myep_bsae/RobotPwm'; }
};
