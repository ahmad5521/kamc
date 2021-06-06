import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class notic extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new noticState();
  }
}

class noticState extends State<notic> {
  File _imageFile;
  var users = <String>[
    'نوع ١',
    'نوع ٢',
    'نوع ٣',
    'نوع ٤',
  ];

  int _user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () => Navigator.pushReplacementNamed(context, '/'),
            icon: Icon(Icons.close),
          )
        ],
        title: Text('صفحة البلاغات', style: TextStyle(fontFamily: 'arabic')),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height*1.28,
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.2), BlendMode.dstATop),
                  image: AssetImage('assets/loginBackground.png'),
                ),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'لإضافة بلاغ يمكنك ملئ النموذج التالي:',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'arabic'),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 40.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10.0,
                        ),
//                    TextField(
//                      keyboardType: TextInputType.number,
//                      decoration: InputDecoration(fillColor: Colors.white70,
//                          filled: true,
//                          labelText: 'رقم المنشأة',
//                          labelStyle: TextStyle(fontFamily: 'arabic')),
//                    ),
//                    SizedBox(
//                      height: 10.0,
//                    ),
//                    TextField(
//                      keyboardType: TextInputType.number,
//                      decoration: InputDecoration(
//                        fillColor: Colors.white70,
//                        filled: true,
//                        labelText: 'رقم المنشأة',
//                        labelStyle: TextStyle(fontFamily: 'arabic'),
//                      ),
//                    ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Card(
                          child: Container(
                            decoration: BoxDecoration(color: Colors.white70),
                            width: double.infinity,
                            height: 60.0,
                            child: DropdownButton<String>(
                              hint: Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Text(
                                  'اختر من القائمة نوع البلاغ',
                                  style: TextStyle(fontFamily: 'arabic'),
                                ),
                              ),
                              value: _user == null ? null : users[_user],
                              items: users.map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Text(value),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _user = users.indexOf(value);
                                });
                              },
                            ),
                          ),
                        ),
                        Card(
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 10.0),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  margin:
                                  EdgeInsets.symmetric(horizontal: 30.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text('الملاحظات:',
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor,
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
                                  margin:
                                  EdgeInsets.symmetric(horizontal: 30.0),
                                  child: TextField(
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
                                            color:
                                            Theme.of(context).accentColor,
                                            fontFamily: 'arabic',
                                            fontWeight: FontWeight.normal)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 10.0),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 30.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text('الموقع:',
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontFamily: 'arabic',
                                              fontWeight: FontWeight.bold)),
                                      Icon(
                                        Icons.location_on,
                                        color: Theme.of(context).accentColor,
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 30.0),
                                  child: TextField(
                                    maxLines: 3,
                                    keyboardType: TextInputType.multiline,
                                    maxLength: 150,
                                    style: TextStyle(
                                        color: Theme.of(context).accentColor,
                                        fontFamily: 'arabic',
                                        fontWeight: FontWeight.normal),
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'يمكنك اضافة الموقع هنا',
                                        hintStyle: TextStyle(
                                            color:
                                                Theme.of(context).accentColor,
                                            fontFamily: 'arabic',
                                            fontWeight: FontWeight.normal)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 10.0),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 30.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text('اضافة صورة:',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor,
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
                                        right: 30.0,
                                        left: 30.0,
                                        top: 20.0,
                                        bottom: 20.0),
                                    child: _imageFile != null
                                        ? Image.file(
                                            _imageFile,
                                            fit: BoxFit.cover,
                                            height: 300.0,
                                            width: 275.0,
                                          )
                                        : ButtonTheme(
                                            height: 50.0,
                                            child: OutlineButton(
                                              onPressed: () {
                                                _openImagePicker(context);
                                              },
                                              borderSide: BorderSide(
                                                color: Theme.of(context)
                                                    .accentColor,
                                                width: 2.0,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text('اضافة صورة',
                                                      style: TextStyle(
                                                          color:
                                                              Theme.of(context)
                                                                  .accentColor,
                                                          fontFamily: 'arabic',
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  SizedBox(
                                                    width: 3.0,
                                                  ),
                                                  Icon(
                                                    Icons.photo_camera,
                                                    color: Theme.of(context)
                                                        .accentColor,
                                                  )
                                                ],
                                              ),
                                            )),
                                  ),
                                ],
                              ),
                            ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        right: 40.0, left: 40.0, top: 20.0, bottom: 20.0),
                    child: ButtonTheme(
                      minWidth: 340.0,
                      height: 50.0,
                      child: RaisedButton(
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('ارسال',
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
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              // return object of type Dialog
                              return AlertDialog(
                                title: new Text("شكرا لك"),
                                content: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text("تم استلام البلاغ"),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("شكرا لتعاونكم ")
                                  ],),
                                actions: <Widget>[
                                  // usually buttons at the bottom of the dialog
                                  new FlatButton(
                                    child: new Text("اغلاق"),
                                    onPressed: () {
                                      Navigator.pushReplacementNamed(context, '/');
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
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
}
