import 'package:flutter/material.dart';


import 'package:scoped_model/scoped_model.dart';
import '../scopedModel/mainScopedModel.dart';
import '../widgets/myDrawer.dart';
import './newOrders.dart';
import './oldOrders.dart';

class orders extends StatefulWidget {
  mainScopedModel model;

  orders(this.model);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ordersState();
  }
}

class _ordersState extends State<orders> {
  @override
  void initState() {
    widget.model.fetchAllServiceRrequests();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: myDrawer(),
        appBar: AppBar(
          title: Text('طلبات الصيانة',
              style: TextStyle(fontSize: 20.0, fontFamily: 'arabic')),
          bottom: TabBar(
              labelStyle: TextStyle(fontSize: 16.0, fontFamily: 'arabic'),
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.flash_on),
                text: 'الطلبات الجديدة',
              ),
              Tab(
                icon: Icon(Icons.done_all),
                text: 'جميع الطلبات',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[newOrders(widget.model), oldOrders(widget.model)],
        ),
        floatingActionButton: Container(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/requestNewOrder');
                },
                tooltip: 'اضافة طلب جديد',
                child: new Icon(Icons.add),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
