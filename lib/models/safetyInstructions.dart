import 'package:flutter/material.dart';

class safetyInstructions {
  final int AUTOID;
  final int MA_PR_MAINNO;
  final String MSG_Titile;
  final String MSG_Text;

  safetyInstructions(
      {@required this.AUTOID,
        @required this.MA_PR_MAINNO,
        @required this.MSG_Titile,
        @required this.MSG_Text});


  factory safetyInstructions.fromJson(Map<String, dynamic> parsedJson){
    return safetyInstructions(
      AUTOID: parsedJson['AUTOID'] == null ? 0 : int.parse(parsedJson['AUTOID']),
      MA_PR_MAINNO: parsedJson['MA_PR_MAINNO'] == null ? 0 : int.parse(parsedJson['MA_PR_MAINNO']),
      MSG_Titile: parsedJson['MSG_Titile'],
      MSG_Text: parsedJson['MSG_Text'],
    );
  }
}
