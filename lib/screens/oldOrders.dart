import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';
import '../scopedModel/mainScopedModel.dart';

class oldOrders extends StatelessWidget {
  mainScopedModel model;

  oldOrders(this.model);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.2), BlendMode.dstATop),
            image: AssetImage('assets/loginBackground.png'),
          ),
        ),
        child: ScopedModelDescendant<mainScopedModel>(
            builder: (context, child, model) {
          return model.isLoading
              ? _bodyProgress(context)
              : _listViewBuilder(model);
        }));
  }

  Widget _listViewBuilder(model) {
    if (model.getOldServiceRequestsList.length > 0 ||
        model.getOldServiceRequestsList.length == null) {
      return ListView.builder(
        itemCount: model.getOldServiceRequestsList.length,
        itemBuilder: (context, index) {
          return Dismissible(
              key: Key(''),
              onDismissed: (_) {},
              background: Container(color: Theme.of(context).primaryColor),
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ListTile(
                        leading: Icon(Icons.album),
                        title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width /
                                    100 * 40,
                                child: Text(
                                    model.getOldServiceRequestsList[index]
                                        .transDesc,
                                    style: TextStyle(
                                        fontFamily: 'arabic',
                                        fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                child: Text(
                                    model.getOldServiceRequestsList[index]
                                        .status,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'arabic',
                                        fontWeight: FontWeight.bold,
                                        color: model
                                            .getOldServiceRequestsList[index]
                                            .color)),
                              ),
                            ]),
                        subtitle: Text(
                            model.getOldServiceRequestsList[index].transdate
                                    .toString()
                                    .substring(0, 10) +
                                '  - ' +
                                model.getOldServiceRequestsList[index].transdate
                                    .toString()
                                    .substring(11, 16),
                            style: TextStyle(fontFamily: 'arabic'))),
                    ButtonTheme.bar(
                      child: ButtonBar(
                        children: <Widget>[
                          FlatButton(
                            child: Text('اعادة الطلب',
                                style: TextStyle(
                                    fontFamily: 'arabic',
                                    fontWeight: FontWeight.bold)),
                            onPressed: () {},
                          ),
                          FlatButton(
                            child: Text('عرض التفاصيل',
                                style: TextStyle(
                                    fontFamily: 'arabic',
                                    fontWeight: FontWeight.bold)),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ));
        },
      );
    } else {
      return Center(
        child: Text('لا توجد بيانات ..',
            style: TextStyle(
                fontFamily: 'arabic',
                fontSize: 18,
                fontWeight: FontWeight.bold)),
      );
    }
  }

  Container _bodyProgress(context) {
    return Container(
      child: Stack(
        children: <Widget>[
          _listViewBuilder(model),
          Container(
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
              color: Colors.white70,
            ),
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10.0)),
              width: 230.0,
              height: 150.0,
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
