import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';
import '../scopedModel/mainScopedModel.dart';

import '../widgets/myDrawer.dart';

class profile extends StatefulWidget {
  final mainScopedModel model;
  profile(this.model);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _profileState();
  }
}

class _profileState extends State<profile> {
  @override
  void initState() {
//    print(widget.model.getUserData.mobileNo + "ghjgjghjhgjghjhg");
    if(widget.model.getUserData == null){
//      widget.model.fetchUserData(1, 2).then((_)
//      {
        widget.model.fetchAllServiceRrequests();
//      }
//      );
    }
    else{
      widget.model.fetchAllServiceRrequests();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: myDrawer(),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.edit,
              color: Colors.white,
            ),
          )
        ],
        title: Text('بياناتي',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
                fontFamily: 'arabic')),
      ),
      body: ScopedModelDescendant<mainScopedModel>(
          builder: (context, child, model) {
        return model.isLoading
            ? _bodyProgress(context)
            : _buildPageContent(model);
      }),
    );
  }
  Container _buildPageContent(model) {
    return Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.2), BlendMode.dstATop),
            image: AssetImage('assets/loginBackground.png'),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.asset('assets/icon.png', width: 165.0, height: 165.0),
              Container(
                margin: EdgeInsets.only(bottom: 10.0),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(right: 20.0),
                          child: Column(
                            children: <Widget>[
                              Text('طلبات تحت الاجراء',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'arabic')),
                              SizedBox(
                                height: 5.0,
                              ),
                              CircleAvatar(
                                backgroundColor: Theme.of(context).primaryColor,
                                child: Text(
                                  model.getNewServiceRequestsList.length
                                      .toString(),
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          )),
                      Container(
//                              margin: EdgeInsets.only(left: 20.0),
                          child: Column(
                        children: <Widget>[
                          Text('طلبات منتهية',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'arabic')),
                          SizedBox(
                            height: 5.0,
                          ),
                          CircleAvatar(
                            backgroundColor: Theme.of(context).primaryColor,
                            child: Text(
                              model.getOldServiceRequestsList.length.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      )),
                      Container(
                          margin: EdgeInsets.only(left: 20.0),
                          child: Column(
                            children: <Widget>[
                              Text('جميع الطلبات',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'arabic')),
                              SizedBox(
                                height: 5.0,
                              ),
                              CircleAvatar(
                                backgroundColor: Theme.of(context).primaryColor,
                                child: Text(
                                  (model.getNewServiceRequestsList.length +
                                          model
                                              .getOldServiceRequestsList.length)
                                      .toString(),
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.all(5.0),
                child: ListTile(
                  title: Text('الاسم',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'arabic')),
                  subtitle: Text(model.getUserData.name.toString().trim(),
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'arabic')),
//                    leading: Icon(Icons.title),
                  trailing: Icon(
                    Icons.verified_user,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.all(5.0),
                child: ListTile(
                  title: Text('الرقم العام',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'arabic')),
                  subtitle: Text(model.getUserData.GID.toString().trim(),
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'arabic')),
//                    leading: Icon(Icons.info),
                  trailing: Icon(
                    Icons.verified_user,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.all(5.0),
                child: ListTile(
                  title: Text('رقم الهوية',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'arabic')),
                  subtitle: Text(model.getUserData.NID.toString().trim(),
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'arabic')),
                  trailing: Icon(
                    Icons.verified_user,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.all(5.0),
                child: ListTile(
                  title: Text('رقم المنزل',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'arabic')),
                  subtitle: Text(model.getUserData.hNO.toString().trim(),
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'arabic')),
                  trailing: Icon(
                    Icons.verified_user,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.all(5.0),
                child: ListTile(
                  title: Text('رقم الجوال',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'arabic')),
                  subtitle: Text(model.getUserData.mobileNo.toString().trim(),
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'arabic')),
                  trailing: model.getUserData.mobileNo != null
                      ? Icon(
                          Icons.verified_user,
                          color: Theme.of(context).primaryColor,
                        )
                      : Icon(
                          Icons.error_outline,
                          color: Colors.redAccent,
                        ),
                ),
              ),
              Card(
                margin: EdgeInsets.all(5.0),
                child: ListTile(
                  title: Text('الاجرة',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'arabic')),
                  subtitle: Text(model.getUserData.rent.toString().trim() + ' ريال',
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'arabic')),
                  trailing: Icon(
                    Icons.verified_user,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.all(5.0),
                child: ListTile(
                  title: Text('الغرامات',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'arabic')),
                  subtitle: Text(model.getUserData.fee.toString().trim() + ' ريال',
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'arabic')),
                  trailing: Icon(
                    Icons.verified_user,
                    color: Theme.of(context).primaryColor,
                  ),
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
//          _buildPageContent(model),
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
}
