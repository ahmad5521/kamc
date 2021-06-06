import 'package:flutter/material.dart';

class servicesGrps {
  final String grpId;
  final String Description;
  final String AraDescription;
  final bool isAppActive;

  servicesGrps(
      {@required this.grpId,
        @required this.Description,
        @required this.AraDescription,
        @required this.isAppActive});


  factory servicesGrps.fromJson(Map<String, dynamic> parsedJson){
    return servicesGrps(
      grpId: parsedJson['grpId'] == null ? '0' : parsedJson['grpId'].toString(),
      Description: parsedJson['Description'],
      AraDescription: parsedJson['AraDescription'],
      isAppActive: parsedJson['isAppActive'],
    );
  }
}
