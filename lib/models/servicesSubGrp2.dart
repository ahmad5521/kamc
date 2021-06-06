import 'package:flutter/material.dart';

class servicesSubGrp2 {
  final String subGrp2Id;
  final String subgrpId;
  final String Description;
  final String AraDescription;

  servicesSubGrp2(
      {@required this.subGrp2Id,
        @required this.subgrpId,
        @required this.Description,
        @required this.AraDescription});


  factory servicesSubGrp2.fromJson(Map<String, dynamic> parsedJson){
    return servicesSubGrp2(
      subGrp2Id: parsedJson['subGrp2Id'] == null ? '0' : parsedJson['subGrp2Id'].toString(),
      subgrpId: parsedJson['subgrpId'] == null ? '0' : parsedJson['subgrpId'].toString(),
      Description: parsedJson['Description'],
      AraDescription: parsedJson['AraDescription'],
    );
  }
}
