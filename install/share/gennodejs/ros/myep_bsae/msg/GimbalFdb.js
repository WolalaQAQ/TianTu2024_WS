// Auto-generated. Do not edit!

// (in-package myep_bsae.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class GimbalFdb {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.stamp = null;
      this.pitch_angle_fdb = null;
      this.yaw_angle_fdb = null;
      this.pitch_ground_angle_fdb = null;
      this.yaw_ground_angle_fdb = null;
    }
    else {
      if (initObj.hasOwnProperty('stamp')) {
        this.stamp = initObj.stamp
      }
      else {
        this.stamp = {secs: 0, nsecs: 0};
      }
      if (initObj.hasOwnProperty('pitch_angle_fdb')) {
        this.pitch_angle_fdb = initObj.pitch_angle_fdb
      }
      else {
        this.pitch_angle_fdb = 0.0;
      }
      if (initObj.hasOwnProperty('yaw_angle_fdb')) {
        this.yaw_angle_fdb = initObj.yaw_angle_fdb
      }
      else {
        this.yaw_angle_fdb = 0.0;
      }
      if (initObj.hasOwnProperty('pitch_ground_angle_fdb')) {
        this.pitch_ground_angle_fdb = initObj.pitch_ground_angle_fdb
      }
      else {
        this.pitch_ground_angle_fdb = 0.0;
      }
      if (initObj.hasOwnProperty('yaw_ground_angle_fdb')) {
        this.yaw_ground_angle_fdb = initObj.yaw_ground_angle_fdb
      }
      else {
        this.yaw_ground_angle_fdb = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GimbalFdb
    // Serialize message field [stamp]
    bufferOffset = _serializer.time(obj.stamp, buffer, bufferOffset);
    // Serialize message field [pitch_angle_fdb]
    bufferOffset = _serializer.float32(obj.pitch_angle_fdb, buffer, bufferOffset);
    // Serialize message field [yaw_angle_fdb]
    bufferOffset = _serializer.float32(obj.yaw_angle_fdb, buffer, bufferOffset);
    // Serialize message field [pitch_ground_angle_fdb]
    bufferOffset = _serializer.float32(obj.pitch_ground_angle_fdb, buffer, bufferOffset);
    // Serialize message field [yaw_ground_angle_fdb]
    bufferOffset = _serializer.float32(obj.yaw_ground_angle_fdb, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GimbalFdb
    let len;
    let data = new GimbalFdb(null);
    // Deserialize message field [stamp]
    data.stamp = _deserializer.time(buffer, bufferOffset);
    // Deserialize message field [pitch_angle_fdb]
    data.pitch_angle_fdb = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [yaw_angle_fdb]
    data.yaw_angle_fdb = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [pitch_ground_angle_fdb]
    data.pitch_ground_angle_fdb = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [yaw_ground_angle_fdb]
    data.yaw_ground_angle_fdb = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'myep_bsae/GimbalFdb';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4baddb8bc789a9d0d6c754f66cd82965';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    time stamp
    float32 pitch_angle_fdb
    float32 yaw_angle_fdb
    float32 pitch_ground_angle_fdb
    float32 yaw_ground_angle_fdb
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GimbalFdb(null);
    if (msg.stamp !== undefined) {
      resolved.stamp = msg.stamp;
    }
    else {
      resolved.stamp = {secs: 0, nsecs: 0}
    }

    if (msg.pitch_angle_fdb !== undefined) {
      resolved.pitch_angle_fdb = msg.pitch_angle_fdb;
    }
    else {
      resolved.pitch_angle_fdb = 0.0
    }

    if (msg.yaw_angle_fdb !== undefined) {
      resolved.yaw_angle_fdb = msg.yaw_angle_fdb;
    }
    else {
      resolved.yaw_angle_fdb = 0.0
    }

    if (msg.pitch_ground_angle_fdb !== undefined) {
      resolved.pitch_ground_angle_fdb = msg.pitch_ground_angle_fdb;
    }
    else {
      resolved.pitch_ground_angle_fdb = 0.0
    }

    if (msg.yaw_ground_angle_fdb !== undefined) {
      resolved.yaw_ground_angle_fdb = msg.yaw_ground_angle_fdb;
    }
    else {
      resolved.yaw_ground_angle_fdb = 0.0
    }

    return resolved;
    }
};

module.exports = GimbalFdb;
