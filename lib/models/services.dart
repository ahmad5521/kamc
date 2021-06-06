import 'package:flutter/material.dart';

class services {
  final String transcode;
  final String subGrp2Id;
  final String Description;
  final String AraDescription;

  services(
      {@required this.transcode,
        @required this.subGrp2Id,
        @required this.Description,
        @required this.AraDescription});


  factory services.fromJson(Map<String, dynamic> parsedJson){
    return services(
      transcode: parsedJson['transcode'] == null ? '0' : parsedJson['transcode'].toString(),
      subGrp2Id: parsedJson['subGrp2Id'] == null ? '0' : parsedJson['subGrp2Id'].toString(),
      Description: parsedJson['Description'],
      AraDescription: parsedJson['AraDescription'],
    );
  }
}
