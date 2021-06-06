import 'package:flutter/material.dart';

class loginI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('', style: TextStyle(fontFamily: 'arabic')),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
//            padding: EdgeInsets.only(bottom: 20.0),
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
                'دخول منشآت ',
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
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          fillColor: Colors.white70,
                          filled: true,
                          labelText: 'رقم المنشأة',
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
                child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  child: Text(
                    'دخول',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontFamily: 'arabic'),
                  ),
                  onPressed: () {
//                  Navigator.pushNamed(context, '/notic');
                    print("pressed");
                  },
                ),
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
                    print("pressed");
                  },
                ),
              ), //
            ],
          ),
        ),
      ),
    );
  }
}
