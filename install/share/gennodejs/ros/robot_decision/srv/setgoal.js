// Auto-generated. Do not edit!

// (in-package robot_decision.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class setgoalRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.point = null;
    }
    else {
      if (initObj.hasOwnProperty('point')) {
        this.point = initObj.point
      }
      else {
        this.point = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type setgoalRequest
    // Serialize message field [point]
    bufferOffset = _serializer.int32(obj.point, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type setgoalRequest
    let len;
    let data = new setgoalRequest(null);
    // Deserialize message field [point]
    data.point = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robot_decision/setgoalRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '124814f25aab91d6a7537044d96f3ddf';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 point
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new setgoalRequest(null);
    if (msg.point !== undefined) {
      resolved.point = msg.point;
    }
    else {
      resolved.point = 0
    }

    return resolved;
    }
};

class setgoalResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.response = null;
    }
    else {
      if (initObj.hasOwnProperty('response')) {
        this.response = initObj.response
      }
      else {
        this.response = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type setgoalResponse
    // Serialize message field [response]
    bufferOffset = _serializer.bool(obj.response, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type setgoalResponse
    let len;
    let data = new setgoalResponse(null);
    // Deserialize message field [response]
    data.response = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robot_decision/setgoalResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '003b81baa95ab323fc1ddf3c7d0bee81';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool response
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new setgoalResponse(null);
    if (msg.response !== undefined) {
      resolved.response = msg.response;
    }
    else {
      resolved.response = false
    }

    return resolved;
    }
};

module.exports = {
  Request: setgoalRequest,
  Response: setgoalResponse,
  md5sum() { return '74d769a249841381656eaa787295c883'; },
  datatype() { return 'robot_decision/setgoal'; }
};
