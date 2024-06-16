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

class GimbalCmd {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.pitch = null;
      this.yaw = null;
      this.pitch_speed = null;
      this.yaw_speed = null;
    }
    else {
      if (initObj.hasOwnProperty('pitch')) {
        this.pitch = initObj.pitch
      }
      else {
        this.pitch = 0.0;
      }
      if (initObj.hasOwnProperty('yaw')) {
        this.yaw = initObj.yaw
      }
      else {
        this.yaw = 0.0;
      }
      if (initObj.hasOwnProperty('pitch_speed')) {
        this.pitch_speed = initObj.pitch_speed
      }
      else {
        this.pitch_speed = 0.0;
      }
      if (initObj.hasOwnProperty('yaw_speed')) {
        this.yaw_speed = initObj.yaw_speed
      }
      else {
        this.yaw_speed = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GimbalCmd
    // Serialize message field [pitch]
    bufferOffset = _serializer.float32(obj.pitch, buffer, bufferOffset);
    // Serialize message field [yaw]
    bufferOffset = _serializer.float32(obj.yaw, buffer, bufferOffset);
    // Serialize message field [pitch_speed]
    bufferOffset = _serializer.float32(obj.pitch_speed, buffer, bufferOffset);
    // Serialize message field [yaw_speed]
    bufferOffset = _serializer.float32(obj.yaw_speed, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GimbalCmd
    let len;
    let data = new GimbalCmd(null);
    // Deserialize message field [pitch]
    data.pitch = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [yaw]
    data.yaw = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [pitch_speed]
    data.pitch_speed = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [yaw_speed]
    data.yaw_speed = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'myep_bsae/GimbalCmd';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b6efcebeeaac7a8075e1a22aebb46de3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 pitch
    float32 yaw
    float32 pitch_speed
    float32 yaw_speed
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GimbalCmd(null);
    if (msg.pitch !== undefined) {
      resolved.pitch = msg.pitch;
    }
    else {
      resolved.pitch = 0.0
    }

    if (msg.yaw !== undefined) {
      resolved.yaw = msg.yaw;
    }
    else {
      resolved.yaw = 0.0
    }

    if (msg.pitch_speed !== undefined) {
      resolved.pitch_speed = msg.pitch_speed;
    }
    else {
      resolved.pitch_speed = 0.0
    }

    if (msg.yaw_speed !== undefined) {
      resolved.yaw_speed = msg.yaw_speed;
    }
    else {
      resolved.yaw_speed = 0.0
    }

    return resolved;
    }
};

module.exports = GimbalCmd;
