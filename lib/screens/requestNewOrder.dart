import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/time_picker_formfield.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scopedModel/mainScopedModel.dart';
import '../models/mobileRequest.dart';

class requestNewOrder extends StatefulWidget {
  mainScopedModel model;
  requestNewOrder(this.model);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _requestNewOrderState();
  }
}

class _requestNewOrderState extends State<requestNewOrder> {
  final timeFormat = DateFormat("h:mm a");
  int currentStep, selectedTransCode;
  File _imageFile;
  final notesController = TextEditingController();
  String _timePreffered = "" ;
  String selectedTransDesc = "";


  @override
  void initState() {
    widget.model.fetchServicesGrps();
    currentStep = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _createAppBar(context), body: _buildBody());
  }

  Widget _buildBody() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(.2), BlendMode.dstATop),
          image: AssetImage('assets/loginBackground.png'),
        ),
      ),
      child: ScopedModelDescendant<mainScopedModel>(
        builder: (context, child, model) {
          return model.isLoading
              ? _bodyProgress(context)
              : _buildContent(model);
        },
      ),
    );
  }

  Container _buildContent(model) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(),
      child: SingleChildScrollView(
        child: Center(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: _buildButton(model),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildButton(model) {
    List<Widget> myWidget = List<Widget>();
    myWidget.add(SizedBox(
      height: 10.0,
    ));
    if (currentStep == 1) {    /// step 1
      (model.getServicesGrpsList as List).forEach((item) {
        Widget wd = Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.album),
                  title: Text(item.AraDescription.trim(),
                      style: TextStyle(
                          fontFamily: 'arabic', fontWeight: FontWeight.bold)),
                  subtitle: Text(item.AraDescription.trim(),
                      style: TextStyle(fontFamily: 'arabic')),
                  trailing: Column(
                    children: <Widget>[
                      Icon(
                        Icons.verified_user,
                        color: Theme.of(context).primaryColor,
                      ),
                      Text('متاح',
                          style: TextStyle(
                            fontFamily: 'arabic',
                            color: Theme.of(context).primaryColor,
                          )),
                    ],
                  ),
                ),
                ButtonTheme.bar(
                  child: ButtonBar(
                    children: <Widget>[
//                        FlatButton(
//                          child: const Text('BUY TICKETS'),
//                          onPressed: () {/* ... */},
//                        ),
                      FlatButton(
                        child: const Text('اختيار',
                            style: TextStyle(
                                fontFamily: 'arabic',
                                fontWeight: FontWeight.bold)),
                        onPressed: () {
//                        if(model.getServicesSubGrpsList.length != null || model.getServicesSubGrpsList.length != 0)
                          model.fetchServicesSubGrps(item.grpId.trim());
                          setState(() {
                            currentStep = 2;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
        myWidget.add(wd);
      });
    } else if (currentStep == 2) {    /// step 2
      (model.getServicesSubGrpsList as List).forEach((item) {
        Widget wd = Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.album),
                  title: Text(item.AraDescription.trim(),
                      style: TextStyle(
                          fontFamily: 'arabic', fontWeight: FontWeight.bold)),
                  subtitle: Text(item.Description.trim(),
                      style: TextStyle(fontFamily: 'arabic')),
                  trailing: Column(
                    children: <Widget>[
                      Icon(
                        Icons.verified_user,
                        color: Theme.of(context).primaryColor,
                      ),
                      Text('متاح',
                          style: TextStyle(
                            fontFamily: 'arabic',
                            color: Theme.of(context).primaryColor,
                          )),
                    ],
                  ),
                ),
                ButtonTheme.bar(
                  child: ButtonBar(
                    children: <Widget>[
//                        FlatButton(
//                          child: const Text('BUY TICKETS'),
//                          onPressed: () {/* ... */},
//                        ),
                      FlatButton(
                        child: const Text('اختيار',
                            style: TextStyle(
                                fontFamily: 'arabic',
                                fontWeight: FontWeight.bold)),
                        onPressed: () {
                          model.fetchServicesSubGrp2(item.subGrpId.trim());
                          setState(() {
                            currentStep = 3;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
        myWidget.add(wd);
      });
    } else if (currentStep == 3) {    /// step 3
      (model.getServicesSubGrp2List as List).forEach((item) {
        Widget wd = Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.album),
                  title: Text(item.AraDescription.trim(),
                      style: TextStyle(
                          fontFamily: 'arabic', fontWeight: FontWeight.bold)),
                  subtitle: Text(item.Description.trim(),
                      style: TextStyle(fontFamily: 'arabic')),
                  trailing: Column(
                    children: <Widget>[
                      Icon(
                        Icons.verified_user,
                        color: Theme.of(context).primaryColor,
                      ),
                      Text('متاح',
                          style: TextStyle(
                            fontFamily: 'arabic',
                            color: Theme.of(context).primaryColor,
                          )),
                    ],
                  ),
                ),
                ButtonTheme.bar(
                  child: ButtonBar(
                    children: <Widget>[
//                        FlatButton(
//                          child: const Text('BUY TICKETS'),
//                          onPressed: () {/* ... */},
//                        ),
                      FlatButton(
                        child: const Text('اختيار',
                            style: TextStyle(
                                fontFamily: 'arabic',
                                fontWeight: FontWeight.bold)),
                        onPressed: () {
                          model.fetchServices(item.subGrp2Id.trim());
                          setState(() {
                            currentStep = 4;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
        myWidget.add(wd);
      });
    } else if (currentStep == 4) {    /// step 4
      (model.getServicesList as List).forEach((item) {
        Widget wd = Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.album,),
                  title: Text(item.AraDescription.trim(),
                      style: TextStyle(
                          fontFamily: 'arabic', fontWeight: FontWeight.bold)),
                  subtitle: Text(item.Description.trim(),
                      style: TextStyle(fontFamily: 'arabic')),
                  trailing: Column(
                    children: <Widget>[
                      Icon(
                        Icons.verified_user,
                        color: Theme.of(context).primaryColor,
                      ),
                      Text('متاح',
                          style: TextStyle(
                            fontFamily: 'arabic',
                            color: Theme.of(context).primaryColor,
                          )),
                    ],
                  ),
                ),
                ButtonTheme.bar(
                  child: ButtonBar(
                    children: <Widget>[
//                        FlatButton(
//                          child: const Text('BUY TICKETS'),
//                          onPressed: () {/* ... */},
//                        ),
                      FlatButton(
                        child: const Text('اختيار',
                            style: TextStyle(
                                fontFamily: 'arabic',
                                fontWeight: FontWeight.bold)),
                        onPressed: () {
                          setState(() {
                            selectedTransCode = int.parse(item.transcode);
                            selectedTransDesc = item.AraDescription.toString().trim();

                            currentStep = 5;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
        myWidget.add(wd);
      });
    } else if (currentStep == 5) {    /// step 5
//      Widget wd = Center(child: Text((model.getServicesList as List<services>).where((s) => s.transcode.trim() == selectedTransCode.toString().trim() ).first.AraDescription,),);
      Widget wd = Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Card(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('الوقت المفضل:',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontFamily: 'arabic',
                                  fontWeight: FontWeight.bold)),
                          Icon(
                            Icons.timer,
                            color: Theme.of(context).accentColor,
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30.0),
                      child: TimePickerFormField(
                          format: timeFormat,
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontFamily: 'arabic',
                              fontWeight: FontWeight.normal),
                          decoration: InputDecoration(
                              labelText: 'الساعة (٢٤)',
                              labelStyle: TextStyle(
                                  fontFamily: 'arabic',
                                  color: Theme.of(context).accentColor)),
                          onChanged: (t) {
                            _timePreffered = t.toString();
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Card(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('الملاحظات:',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontFamily: 'arabic',
                                  fontWeight: FontWeight.bold)),
                          Icon(
                            Icons.note,
                            color: Theme.of(context).accentColor,
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30.0),
                      child: TextField(
                        controller: notesController,
                        maxLines: 5,
                        keyboardType: TextInputType.multiline,
                        maxLength: 200,
                        style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontFamily: 'arabic',
                            fontWeight: FontWeight.normal),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'يمكنك اضافة ملاحظاتك هنا',
                            hintStyle: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontFamily: 'arabic',
                                fontWeight: FontWeight.normal)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Card(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('اضافة صورة:',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontFamily: 'arabic',
                                  fontWeight: FontWeight.bold)),
                          Icon(
                            Icons.photo,
                            color: Theme.of(context).accentColor,
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          right: 30.0, left: 30.0, top: 20.0, bottom: 20.0),
                      child: _imageFile != null
                          ? Image.file(_imageFile, fit: BoxFit.cover, height: 300.0, width: 275.0,)
                          : ButtonTheme(
                              height: 50.0,
                              child: OutlineButton(
                                onPressed: () {
                                  _openImagePicker(context);
                                },
                                borderSide: BorderSide(
                                color: Theme.of(context).accentColor,
                                width: 2.0,
                              ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text('اضافة صورة',
                                        style: TextStyle(
                                            color: Theme.of(context).accentColor,
                                            fontFamily: 'arabic',
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      width: 3.0,
                                    ),
                                    Icon(
                                      Icons.photo_camera,
                                      color: Theme.of(context).accentColor,
                                    )
                                  ],
                                ),
                              )),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
//            child: Card(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                          right: 5.0, left: 5.0, top: 20.0, bottom: 20.0),
                      child: model.isLoadingBtn ? CircularProgressIndicator()
                          :
                      ButtonTheme(
                          height: 50.0,
                          child: FlatButton(
                            onPressed: () async{
                              if(_imageFile != null){
                                if(await model.uploadImage(_imageFile) == "ok"){
                                  mobileRequest mr = mobileRequest(
                                      g_id: model.getUserData.GID,
                                      transcode: selectedTransCode,
                                      transDesc: selectedTransDesc,
                                      transdate: DateTime.now(),
                                      status: 0,
                                      timePrefered: _timePreffered,
                                      userNote: notesController.text,
                                      gID: model.getCurrentImageID);

                                  
                                  if(await model.postrequest(mr)){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        // return object of type Dialog
                                        return AlertDialog(
                                          title: new Text("تمت الاضافة"),
                                          content: new Text("تمت الاضافة بنجاح"),
                                          actions: <Widget>[
                                            // usually buttons at the bottom of the dialog
                                            new FlatButton(
                                              child: new Text("اغلاق"),
                                              onPressed: () {
                                                Navigator.pushReplacementNamed(context, '/orders');
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }else{
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        // return object of type Dialog
                                        return AlertDialog(
                                          title: new Text("خطأ"),
                                          content: new Text("حدث خطأ أثناء ارسال الطلب"),
                                          actions: <Widget>[
                                            // usually buttons at the bottom of the dialog
                                            new FlatButton(
                                              child: new Text("اغلاق"),
                                              onPressed: () {
                                                
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }

                                }
                                else{
                                  print("error in image upload");
                                }
                              }
                              else{
                                mobileRequest mr = mobileRequest(
                                    g_id: model.getUserData.GID,
                                    transcode: selectedTransCode,
                                    transDesc: selectedTransDesc,
                                    transdate: DateTime.now(),
                                    status: 0,
                                    timePrefered: _timePreffered,
                                    userNote: notesController.text,
                                    gID: "");

                                
                                if(await model.postrequest(mr)){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        // return object of type Dialog
                                        return AlertDialog(
                                          title: new Text("تمت الاضافة"),
                                          content: new Text("تمت الاضافة بنجاح"),
                                          actions: <Widget>[
                                            // usually buttons at the bottom of the dialog
                                            new FlatButton(
                                              child: new Text("اغلاق"),
                                              onPressed: () {
                                                Navigator.pushReplacementNamed(context, '/orders');
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }else{
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        // return object of type Dialog
                                        return AlertDialog(
                                          title: new Text("خطأ"),
                                          content: new Text("حدث خطأ أثناء ارسال الطلب"),
                                          actions: <Widget>[
                                            // usually buttons at the bottom of the dialog
                                            new FlatButton(
                                              child: new Text("اغلاق"),
                                              onPressed: () {
                                                
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                
                              }
                            },
                            color: Theme.of(context).accentColor,
                            child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('حفظ الطلب',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'arabic',
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                width: 3.0,
                              ),
                              Icon(
                                Icons.save,
                                color: Colors.white,
                              )
                            ],
                          ),
                          )),
                    ),
                  ],
                ),
              ),
          )
        ],
      );

      myWidget.add(wd);
    }

    return myWidget;
  }

  void _openImagePicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 200.0,
            padding: EdgeInsets.all(30.0),
            child: Column(children: [
              Text(
                'اضافة صورة',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontFamily: 'arabic',
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              FlatButton(
                textColor: Theme.of(context).accentColor,
                child: Text('الكاميرا',
                    style: TextStyle(
                        fontFamily: 'arabic', fontWeight: FontWeight.normal)),
                onPressed: () {
                  _getImage(context, ImageSource.camera);
                },
              ),
              FlatButton(
                textColor: Theme.of(context).accentColor,
                child: Text('الجهاز',
                    style: TextStyle(
                        fontFamily: 'arabic', fontWeight: FontWeight.normal)),
                onPressed: () {
                  _getImage(context, ImageSource.gallery);
                },
              )
            ]),
          );
        });
  }

  void _getImage(BuildContext context, ImageSource source) {
    ImagePicker.pickImage(source: source, maxWidth: 400.0).then((File image) {
      setState(() {
        _imageFile = image;
      });

      Navigator.pop(context);
    });
  }

  Container _bodyProgress(context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
              color: Colors.white70,
            ),
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10.0)),
              width: 300.0,
              height: 200.0,
              alignment: AlignmentDirectional.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: SizedBox(
                      height: 50.0,
                      width: 50.0,
                      child: CircularProgressIndicator(
                        value: null,
                        strokeWidth: 7.0,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 25.0),
                    child: Center(
                      child: Text(
                        "الرجاء الانتظار..",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'arabic',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createAppBar(BuildContext context) {
    return AppBar(
      title: Text('طلب جديد',
          style: TextStyle(fontSize: 20.0, fontFamily: 'arabic')),
      actions: [
        IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: currentStep == 1 ? Colors.white30 : Colors.white,
            ),
            onPressed: () {
              setState(() {
                if (currentStep != 1) currentStep = currentStep - 1;
                _imageFile = null;
              });
            }),
        IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.white,
            ),
            onPressed: () =>
                Navigator.pushReplacementNamed(context, '/orders')),
      ],
    );
  }
}
