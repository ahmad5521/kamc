import 'package:flutter/material.dart';

class serviceRrequestsViews {
  final int id;
  final int g_id;
  final int transcode;
  final String transDesc;
  final String transdate;
  final String status;
  Color color;

  serviceRrequestsViews(
      {@required this.id,
        @required this.g_id,
        @required this.transcode,
        @required this.transDesc,
        @required this.transdate,
        @required this.status,
        this.color});


  factory serviceRrequestsViews.fromJson(Map<String, dynamic> parsedJson){
    return serviceRrequestsViews(
      id: parsedJson['Id'] == null ? 0 : int.parse(parsedJson['Id'].toString()),
      g_id: parsedJson['g_id'] == null ? 0 : int.parse(parsedJson['g_id'].toString()),
      transcode: parsedJson['transcode'] == null ? 0 : int.parse(parsedJson['transcode'].toString()),
      transDesc: parsedJson['transDesc'],
      transdate: parsedJson['transdate'].toString(),
      status: parsedJson['status'],
    );
  }
}
