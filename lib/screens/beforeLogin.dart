import 'package:flutter/material.dart';

class beforLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildBodyContainer(context);
  }

  Container _buildBodyContainer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.8), BlendMode.dstATop),
          image: AssetImage('assets/loginBackground.png'),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 30.0,
          ),
          Center(
            child: Image.asset('assets/icon.png', width: 165.0, height: 165.0),
          ),
          SizedBox(
            height: 50.0,
          ),
          buildTitleText(),
          SizedBox(
            height: 10.0,
          ),
          buildTitle2Text(),
          SizedBox(
            height: 170.0,
          ),
          buildLoginPButtonTheme(context),
//          SizedBox(
//            height: 10.0,
//          ),
//          buildLoginIButtonTheme(context),
          SizedBox(
            height: 10.0,
          ),
          buildNoticeButtonTheme(context),
        ],
      ),
    );
  }

  ButtonTheme buildNoticeButtonTheme(BuildContext context) {
    return ButtonTheme(
      minWidth: 250.0,
      height: 50.0,
      child: RaisedButton(
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
        child: Text(
          'بلاغات',
          style: TextStyle(
              color: Colors.white, fontSize: 14.0, fontFamily: 'arabic'),
        ),
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/notic');
          print("pressed");
        },
      ),
    );
  }

  ButtonTheme buildLoginIButtonTheme(BuildContext context) {
    return ButtonTheme(
      minWidth: 250.0,
      height: 50.0,
      child: RaisedButton(
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
        child: Text(
          'دخول منشآت',
          style: TextStyle(
              color: Colors.white, fontSize: 14.0, fontFamily: 'arabic'),
        ),
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/loginI');
          print("pressed");
        },
      ),
    );
  }

  ButtonTheme buildLoginPButtonTheme(BuildContext context) {
    return ButtonTheme(
      minWidth: 250.0,
      height: 50.0,
      child: RaisedButton(
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
        child: Text(
          'دخول ',
          style: TextStyle(
              color: Colors.white, fontSize: 14.0, fontFamily: 'arabic'),
        ),
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/loginP');
          print("pressed");
        },
      ),
    );
  }

  Text buildTitle2Text() {
    return Text(
      'للتشغيل والصيانة ',
      style: TextStyle(
          color: Colors.black87,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'arabic'),
    );
  }

  Text buildTitleText() {
    return Text(
      'ادارة مدينة الملك عبدالعزيز العسكرية ',
      style: TextStyle(
          color: Colors.black87,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'arabic'),
    );
  }
}
