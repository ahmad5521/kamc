import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scopedModel/mainScopedModel.dart';

class loginP extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _loginPState();
  }

}

class _loginPState extends State<loginP>{


  final nid_TextFieldController = TextEditingController();
  final gid_TextFieldController = TextEditingController();

  bool _loading = false;

  Future _loginP() async{




    Navigator.pushReplacementNamed(context, '/profile');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('', style: TextStyle(fontFamily: 'arabic')),
      ),
      body: _loading ? _bodyProgress(context) : _buildBody(context),
    );
  }


//  _loading ? _bodyProgress(context) : _buildBody(context),
  GestureDetector _buildBody(context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(FocusNode());
      },
        child: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.8), BlendMode.dstATop),
          image: AssetImage('assets/loginBackground.png'),
        ),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 30.0,
          ),
          Center(
            child:
                Image.asset('assets/icon.png', width: 165.0, height: 165.0),
          ),
          SizedBox(
            height: 50.0,
          ), //
          Text(
//            'دخول الأفراد ',
            'دخول الساكنين ',
            style: TextStyle(
                color: Colors.black87,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'arabic'),
          ),

          SizedBox(
            height: 70.0,
          ),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 80.0),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: nid_TextFieldController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      fillColor: Colors.white70,
                      filled: true,
                      labelText: 'الهوية الوطنية',
                      labelStyle: TextStyle(fontFamily: 'arabic')),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  controller: gid_TextFieldController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      fillColor: Colors.white70,
                      filled: true,
                      labelText: 'الرقم العام',
                      labelStyle: TextStyle(fontFamily: 'arabic')),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          ButtonTheme(
            minWidth: 250.0,
            height: 50.0,
            child: ScopedModelDescendant<mainScopedModel>(builder: (context, child, model) => RaisedButton(
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              child: Text(
                'دخول',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontFamily: 'arabic'),
              ),
              onPressed: () async{
//                _loginP();
                if(nid_TextFieldController.text != '' || gid_TextFieldController.text != ''){
                  await model.fetchUserData(nid_TextFieldController.text, gid_TextFieldController.text);
                  if(model.getUserData != null)
                  {
                    Navigator.pushReplacementNamed(context, '/profile');
                  }
                  else{
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        // return object of type Dialog
                        return AlertDialog(
                          title: new Text("خطأ"),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              new Text("سجلاتنا تشير الى انك غير مسجل بنظام الاسكان"),
                              new Text("يمكنك مراجعة قسم الاسكان ")
                            ],),
                          actions: <Widget>[
                            // usually buttons at the bottom of the dialog
                            new FlatButton(
                              child: new Text("اغلاق"),
                              onPressed: () {
//                              Navigator.pushReplacementNamed(context, '/loginP');
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                }else{
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      // return object of type Dialog
                      return AlertDialog(
                        title: new Text("خطأ"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new Text("خطأ في الادخالات")
                          ],),
                        actions: <Widget>[
                          // usually buttons at the bottom of the dialog
                          new FlatButton(
                            child: new Text("اغلاق"),
                            onPressed: () {
//                              Navigator.pushReplacementNamed(context, '/loginP');
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    },
                  );
                }


              },
            ),),
          ),
          SizedBox(
            height: 10.0,
          ),
          ButtonTheme(
            minWidth: 250.0,
            height: 50.0,
            child: RaisedButton(
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              child: Text(
                'رجوع',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontFamily: 'arabic'),
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
          ),
        ],
      ),
    ));
  }

  Container _bodyProgress(context) {
    return Container(
      child: Stack(
        children: <Widget>[
          _buildBody(context),
          Container(
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
              color: Colors.white70,
            ),
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10.0)
              ),
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
                          color: Colors.white, fontFamily: 'arabic',
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
}

