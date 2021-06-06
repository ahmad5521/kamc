import 'package:flutter/material.dart';

import './screens/beforeLogin.dart';
import './screens/loginP.dart';
import './screens/loginI.dart';
import './screens/notic.dart';
import './screens/orders.dart';
import './screens/Circulars.dart';
import './screens/saftyInstructions.dart';
import './screens/requestNewOrder.dart';
import './screens/profile.dart';


import 'package:flutter/rendering.dart';

import 'package:scoped_model/scoped_model.dart';
import './scopedModel/mainScopedModel.dart';

void main() {
//  debugPaintSizeEnabled=true;
  runApp(new MyApp());
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() {
    return new _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  mainScopedModel model = mainScopedModel();

  @override
  Widget build(BuildContext context) {

    return ScopedModel<mainScopedModel>(
      model: model,
      child: MaterialApp(
        title: 'idara app',
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Color.fromARGB(255, 99, 115, 99),
          accentColor: Color.fromARGB(255, 151, 142, 125),
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text(
                "", //empty title
              ),
            ),
            body: beforLogin()),
        routes: {
          '/loginP': (BuildContext context) => loginP(),
          '/beforLogin': (BuildContext context) => beforLogin(),
          '/loginI': (BuildContext context) => loginI(),
          '/notic': (BuildContext context) => notic(),
          '/orders': (BuildContext context) => orders(model),
          '/Circulars': (BuildContext context) => Circulars(model),
          '/saftyInstructions': (BuildContext context) => saftyInstructions(model),
          '/requestNewOrder': (BuildContext context) => requestNewOrder(model),
          '/profile': (BuildContext context) => profile(model),
        },
        builder: (BuildContext context, Widget child) {
          return new Directionality(
            textDirection: TextDirection.rtl,
            child: child,
          );
        },
      ),
    );
  }
}

