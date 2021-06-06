import 'package:flutter/material.dart';

class login {
  final int nid;
  final int gid;
  final String deviceID;

  login(
      { this.nid,
        @required this.gid,
        @required this.deviceID});


  factory login.fromJson(Map<String, dynamic> parsedJson){
    return login(
      nid: parsedJson['nid'] == null ? 0 : int.parse(parsedJson['nid']),
      gid: parsedJson['gid'] == null ? 0 : int.parse(parsedJson['gid']),
      deviceID: parsedJson['deviceID'],
    );
  }
}