// Auto-generated. Do not edit!

// (in-package chess_moves.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class movementdataRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type movementdataRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type movementdataRequest
    let len;
    let data = new movementdataRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'chess_moves/movementdataRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new movementdataRequest(null);
    return resolved;
    }
};

class movementdataResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.capture = null;
      this.next_Move = null;
    }
    else {
      if (initObj.hasOwnProperty('capture')) {
        this.capture = initObj.capture
      }
      else {
        this.capture = false;
      }
      if (initObj.hasOwnProperty('next_Move')) {
        this.next_Move = initObj.next_Move
      }
      else {
        this.next_Move = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type movementdataResponse
    // Serialize message field [capture]
    bufferOffset = _serializer.bool(obj.capture, buffer, bufferOffset);
    // Serialize message field [next_Move]
    bufferOffset = _serializer.string(obj.next_Move, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type movementdataResponse
    let len;
    let data = new movementdataResponse(null);
    // Deserialize message field [capture]
    data.capture = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [next_Move]
    data.next_Move = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.next_Move);
    return length + 5;
  }

  static datatype() {
    // Returns string type for a service object
    return 'chess_moves/movementdataResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4cd85a70bbf6cd984a90000cc83dfa07';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool capture
    string next_Move
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new movementdataResponse(null);
    if (msg.capture !== undefined) {
      resolved.capture = msg.capture;
    }
    else {
      resolved.capture = false
    }

    if (msg.next_Move !== undefined) {
      resolved.next_Move = msg.next_Move;
    }
    else {
      resolved.next_Move = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: movementdataRequest,
  Response: movementdataResponse,
  md5sum() { return '4cd85a70bbf6cd984a90000cc83dfa07'; },
  datatype() { return 'chess_moves/movementdata'; }
};
