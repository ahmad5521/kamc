import 'package:scoped_model/scoped_model.dart';
import 'dart:convert';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';
import 'package:device_info/device_info.dart';
import 'package:device_id/device_id.dart';

import '../models/circulars.dart';
import '../models/safetyInstructions.dart';
import '../models/serviceRrequestsViews.dart';
import '../models/profileData.dart';
import '../models/servicesGrps.dart';
import '../models/servicesSubGrps.dart';
import '../models/servicesSubGrp2.dart';
import '../models/services.dart';
import '../models/login.dart';
import '../models/mobileRequest.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:flutter/material.dart';

final _root = 'https://appserv.kamc.gov.sa/api/';

class mainScopedModel extends Model {
  /// is loading
  bool _isLoading = false;
  bool get isLoading {
    return _isLoading;
  }

  /// is loading for buttons
  bool _isLoadingForBtn = false;
  bool get isLoadingBtn {
    return _isLoadingForBtn;
  }

  String _deviceID = null;


  login userLoginData = null;
  /// for profile data
  profileData _userData = null;
  Future<void> fetchUserData(String nid, String gid) async {

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();


    if(Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      print('Running on ${androidInfo.model}');
    }
    else if(Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      print('Running on ${iosInfo.utsname.machine}');
    }


    String deviceid;

    _deviceID = await DeviceId.getID;


    _isLoading = true;
    await http.get(
      '$_root/users?NID=$nid&GID=$gid',
      headers: {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader: "Basic MToy",
        "deviceID": _deviceID
      },
    ).then((response) {
      try {

        _userData = null;
        _userData = profileData.fromJson(json.decode(response.body)[0]);
        _isLoading = false;
        notifyListeners();
      } catch (error) {
        print(error);
        _isLoading = false;
        notifyListeners();
      }
    });
  }

  profileData get getUserData {
    if(_userData != null)
      return profileData.from(_userData);
    else
      return null;
  }

  ///for circurals
  List<circulars> _circularsList = [];
  Future<void> fetchAllCirculars() async {
    _isLoading = true;
    var nid = _userData.NID;
    await http.get(
      '$_root/circulars/$nid/',
      headers: {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader: "Basic MToy",
        "deviceID": _deviceID
      },
    ).then((response) {
      try {
        var a = response.body;
        _circularsList.clear();
        if(response.body != ""){
          _circularsList = (json.decode(response.body) as List)
              .map((data) => new circulars.fromJson(data))
              .toList();
        }
        _isLoading = false;
        notifyListeners();
      } catch (error) {
        print(error);
        _isLoading = false;
        notifyListeners();
      }
    });
  }

  List<circulars> get getCircularsList {
    return List.from(_circularsList);
  }

  ///for safetyInstructions
  List<safetyInstructions> _safetyInstructionsList = [];
  Future<void> fetchAllSafetyInstructions() async {
    _isLoading = true;
    var nid = getUserData.NID;
    await http.get(
      '$_root/safetyInstructions/$nid/',
      headers: {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader: "Basic MToy",
        "deviceID": _deviceID
      },
    ).then((response) {
      try {
        _safetyInstructionsList.clear();
        if(response.body != "") {
          _safetyInstructionsList = (json.decode(response.body) as List)
              .map((data) => new safetyInstructions.fromJson(data))
              .toList();
        }
        _isLoading = false;
        notifyListeners();
      } catch (error) {
        print(error);
        _isLoading = false;
        notifyListeners();
      }
    });
  }

  List<safetyInstructions> get getSafetyInstructionsList {
    return List.from(_safetyInstructionsList);
  }

  ///for oldServiceRrequests
  List<serviceRrequestsViews> _oldServiceRequestsList = [];
  List<serviceRrequestsViews> _newServiceRequestsList = [];
  Future<void> fetchAllServiceRrequests() async {
    _isLoading = true;
    var gid = getUserData.GID;
    await http.get(
      '$_root/serviceRrequestsViews/$gid/',
      headers: {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader: "Basic MToy",
        "deviceID": _deviceID
      },
    ).then((response) {
      try {
        if(response.body !=""){
          List<serviceRrequestsViews> temp = (json.decode(response.body) as List)
              .map((data) => new serviceRrequestsViews.fromJson(data))
              .toList();

          _oldServiceRequestsList.clear();
          _newServiceRequestsList.clear();

          temp.forEach((item) {
            if (item.status.trim() == "تم تسجيل الطلب") {
              item.color = Colors.yellow[700];
              _newServiceRequestsList.add(item);
            } else if (item.status.trim() == "جاري التحقق من الطلب") {
              item.color = Colors.red[700];
              _oldServiceRequestsList.add(item);
            } else {
              item.color = Colors.green[700];
              _oldServiceRequestsList.add(item);
            }
          });
        }
        _isLoading = false;
        notifyListeners();
      } catch (error) {
        print(error);
        _isLoading = false;
        notifyListeners();
      }
    });
  }

  List<serviceRrequestsViews> get getOldServiceRequestsList {
    return List.from(_oldServiceRequestsList);
  }

  List<serviceRrequestsViews> get getNewServiceRequestsList {
    return List.from(_newServiceRequestsList);
  }

  /// for servicesGrps
  List<servicesGrps> _servicesGrpsList = [];
  Future<void> fetchServicesGrps() async {
    _isLoading = true;
    await http.get(
      '$_root/servicesGrps',
      headers: {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader: "Basic MToy",
        "deviceID": _deviceID
      },
    ).then((response) {
      try {
        _servicesGrpsList = (json.decode(response.body) as List)
            .map((data) => new servicesGrps.fromJson(data))
            .toList();
        print(_servicesGrpsList.first.AraDescription);
        print(_servicesGrpsList.first.Description);
        _isLoading = false;
        notifyListeners();
      } catch (error) {
        print(error);
        _isLoading = false;
        notifyListeners();
      }
    });
  }

  List<servicesGrps> get getServicesGrpsList {
    return List.from(_servicesGrpsList);
  }

  /// for servicesSubGrps
  List<servicesSubGrps> _servicesSubGrpsList = [];
  Future<void> fetchServicesSubGrps(String groupId) async {
    _isLoading = true;
    await http.get(
      '$_root/servicesSubGrps/$groupId',
      headers: {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader: "Basic MToy",
        "deviceID": _deviceID
      },
    ).then((response) {
      try {
        _servicesSubGrpsList = (json.decode(response.body) as List)
            .map((data) => new servicesSubGrps.fromJson(data))
            .toList();
        print(_servicesSubGrpsList.first.AraDescription);
        print(_servicesSubGrpsList.first.Description);
        _isLoading = false;
        notifyListeners();
      } catch (error) {
        print(error);
        _isLoading = false;
        notifyListeners();
      }
    });
  }

  List<servicesSubGrps> get getServicesSubGrpsList {
    return List.from(_servicesSubGrpsList);
  }

  /// for servicesSubGrp2
  List<servicesSubGrp2> _servicesSubGrp2List = [];
  Future<void> fetchServicesSubGrp2(String subGroupId) async {
    _isLoading = true;
    await http.get(
      '$_root/servicesSubGrp2/$subGroupId',
      headers: {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader: "Basic MToy",
        "deviceID": _deviceID
      },
    ).then((response) {
      try {
        _servicesSubGrp2List = (json.decode(response.body) as List)
            .map((data) => new servicesSubGrp2.fromJson(data))
            .toList();
        print(_servicesSubGrp2List.first.AraDescription);
        print(_servicesSubGrp2List.first.Description);
        _isLoading = false;
        notifyListeners();
      } catch (error) {
        print(error);
        _isLoading = false;
        notifyListeners();
      }
    });
  }

  List<servicesSubGrp2> get getServicesSubGrp2List {
    return List.from(_servicesSubGrp2List);
  }

  /// for services
  List<services> _servicesList = [];
  Future<void> fetchServices(String subGroup2Id) async {
    _isLoading = true;
    await http.get(
      '$_root/services/$subGroup2Id',
      headers: {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader: "Basic MToy",
        "deviceID": _deviceID
      },
    ).then((response) {
      try {
        _servicesList = (json.decode(response.body) as List)
            .map((data) => new services.fromJson(data))
            .toList();
        print(_servicesSubGrp2List.first.AraDescription);
        print(_servicesSubGrp2List.first.Description);
        _isLoading = false;
        notifyListeners();
      } catch (error) {
        print(error);
        _isLoading = false;
        notifyListeners();
      }
    });
  }

  List<services> get getServicesList {
    return List.from(_servicesList);
  }

  ///for Image
  String _currentImageID = '';
  Future<String> uploadImage(File image, {String imagePath}) async {
    _isLoadingForBtn = true;
    notifyListeners();
    final mimeTypeData = lookupMimeType(image.path).split('/');
    final imageUploadRequest = http.MultipartRequest('POST', Uri.parse(
//            'http://127.0.0.1:8080/api/ImageUpload'));
        '$_root/serviceRequestImages/ImageUpload'));
    final file = await http.MultipartFile.fromPath(
      'image',
      image.path,
      contentType: MediaType(
        mimeTypeData[0],
        mimeTypeData[1],
      ),
    );
    imageUploadRequest.files.add(file);
    if (imagePath != null) {
      imageUploadRequest.fields['imagePath'] = Uri.encodeComponent(imagePath);
    }
    imageUploadRequest.headers['Authorization'] = 'Basic MToy';
    imageUploadRequest.headers['deviceID'] = _deviceID;

    try {
      final streamedResponse = await imageUploadRequest.send();
      final response = await http.Response.fromStream(streamedResponse);
      if (response.statusCode != 200 && response.statusCode != 201) {
        print('Something went wrong');
        print(json.decode(response.body));
        _isLoadingForBtn = false;
        notifyListeners();
        print("error");
        return null;
      }
      final responseData = json.decode(response.body);
      _isLoadingForBtn = false;
      notifyListeners();
      print(responseData);
      _currentImageID = responseData;
      return "ok";
    } catch (error) {
      _isLoadingForBtn = false;
      notifyListeners();
      print(error);
      return null;
    }
  }

  ///to submit request
  String get getCurrentImageID {
    return _currentImageID;
  }

  /// for mobileRequest
  Future<bool> postrequest(mobileRequest mr) async {
    _isLoadingForBtn = true;
    print(mr.transdate);
    try {
      var response = await http.post(
        '$_root/serviceRequests/',
        body: {
          'gID': mr.gID == null ? "" : mr.gID,
          'g_id': mr.g_id,
          'transDesc': mr.transDesc,
          'transcode': mr.transcode.toString(),
          'status': mr.status.toString(),
          'timePrefered': mr.timePrefered == null ? "" : mr.timePrefered,
          'transdate': mr.transdate.toString(),
          'userNote': mr.userNote == null ? "" : mr.userNote
        },
        headers: {
//          "Content-Type": "application/json",
          HttpHeaders.authorizationHeader: "Basic MToy",
          "deviceID": _deviceID
        },
      );
      // print("######################");
      // print(response.body);
      if (response.body == 'true') {
        _isLoadingForBtn = false;
        notifyListeners();
        return true;
      } else {
        _isLoadingForBtn = false;
        notifyListeners();
        return false;
      }
    } catch (error) {
      print(error);
      _isLoadingForBtn = false;
      notifyListeners();
      return false;
    }
  }
}
