import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../scopedModel/mainScopedModel.dart';

class myDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ScopedModelDescendant<mainScopedModel>(builder: (context, child, model) => Column(
        children: <Widget>[
          AppBar(
              automaticallyImplyLeading: false,
              title: Center(child: Text('القائمة', style: TextStyle(fontSize: 20.0, fontFamily: 'arabic')),)
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('الرئيسية', style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold , fontFamily: 'arabic'),),
            onTap: () async{
              Navigator.pushReplacementNamed(context, '/profile');
            },
          ),
          ListTile(
            leading: Icon(Icons.reorder),
            title: Text('طلبات الصيانة', style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold , fontFamily: 'arabic'),),
            onTap: () async{
              Navigator.pushReplacementNamed(context, '/orders');
            },
          ),
          ListTile(
            leading: Icon(Icons.note),
            title: Text('التعاميم', style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold , fontFamily: 'arabic'),),
            onTap: () async{
//              await model.fetchAllCirculars(1);
              Navigator.pushReplacementNamed(context, '/Circulars');
            },
          ),
          ListTile(
            leading: Icon(Icons.merge_type),
            title: Text('ارشادات السلامة', style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold , fontFamily: 'arabic'),),
            onTap: () async{
              Navigator.pushReplacementNamed(context, '/saftyInstructions');
            },
          ),
          ListTile(
            leading: Icon(Icons.system_update),
            title: Text('الدعم الفني', style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold , fontFamily: 'arabic'),),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('خروج', style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold , fontFamily: 'arabic'),),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),),
    );
  }
}
