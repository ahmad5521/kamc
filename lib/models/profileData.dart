import 'package:flutter/material.dart';

class profileData {
  final String GID;
  final String NID;
  final String name;
  final String mobileNo;
  final String rent;
  final String date;
  final String hNO;
  final bool isActive;
  final String pass;
  final bool restricted;
  final String fee;
  final String deviceID;

  profileData(
      {
        @required this.GID,
        @required this.NID,
        @required this.name,
        @required this.mobileNo,
        @required this.rent,
        @required this.date,
        @required this.hNO,
        @required this.isActive,
        @required this.pass,
        @required this.restricted,
        @required this.fee,
        @required this.deviceID});


  factory profileData.fromJson(Map<String, dynamic> parsedJson){
    return profileData(
        GID: parsedJson['GID'],
        NID: parsedJson['NID'],
        name: parsedJson['name'],
        mobileNo: parsedJson['mobileNo'],
        rent: parsedJson['rent'],
        date: parsedJson['date'],
        hNO: parsedJson['hNO'],
        isActive: parsedJson['isActive'] == null ? false : parsedJson['isActive'],
        pass: parsedJson['pass'],
        restricted: parsedJson['restricted'] == null ? false : parsedJson['restricted'],
        fee: parsedJson['fee'],
        deviceID: parsedJson['deviceID']
    );
  }


  factory profileData.from(profileData instance){
    return profileData(
        GID: instance.GID ,
        NID: instance.NID,
        name: instance.name,
        mobileNo: instance.mobileNo,
        rent: instance.rent,
        date: instance.date,
        hNO: instance.hNO,
        isActive: instance.isActive,
        pass: instance.pass,
        restricted: instance.restricted,
        fee: instance.fee,
        deviceID: instance.deviceID
    );
  }
}
