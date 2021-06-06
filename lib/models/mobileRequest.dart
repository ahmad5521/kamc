import 'package:flutter/material.dart';

class mobileRequest {
  final String g_id;
  final int transcode;
  final String transDesc;
  final DateTime transdate;
  final int status;
  final String timePrefered;
  final String userNote;
  final String gID;

  mobileRequest(
      {@required this.g_id,
        @required this.transcode,
        @required this.transDesc,
        @required this.transdate,
        @required this.status,
        @required this.timePrefered,
        @required this.userNote,
        @required this.gID});


  static Map<String, dynamic> getMap(mobileRequest mr){
    return {
      'gID' : mr.gID.isEmpty ? "" : mr.gID,
      'g_id' : mr.g_id.toString(),
      'transDesc' : mr.transDesc,
      'transcode' : mr.transcode,
      'status' : mr.status,
      'timePrefered' : mr.timePrefered,
      'transdate' : mr.transdate,
      'userNote' : mr.userNote
    };
  }

}
