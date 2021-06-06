import 'package:flutter/material.dart';

class servicesSubGrps {
  final String subGrpId;
  final String GrpId;
  final String Description;
  final String AraDescription;

  servicesSubGrps(
      {@required this.subGrpId,
        @required this.GrpId,
        @required this.Description,
        @required this.AraDescription});


  factory servicesSubGrps.fromJson(Map<String, dynamic> parsedJson){
    return servicesSubGrps(
      subGrpId: parsedJson['subGrpId'] == null ? '0' : parsedJson['subGrpId'].toString(),
      GrpId: parsedJson['GrpId'] == null ? '0' : parsedJson['GrpId'].toString(),
      Description: parsedJson['Description'],
      AraDescription: parsedJson['AraDescription'],
    );
  }
}
