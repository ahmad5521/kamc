import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';
import '../scopedModel/mainScopedModel.dart';
import '../widgets/myDrawer.dart';

class saftyInstructions extends StatefulWidget {
  mainScopedModel model;

  saftyInstructions(this.model);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _saftyInstructions();
  }

}

class _saftyInstructions extends State<saftyInstructions>{
  @override
  void initState() {
    widget.model.fetchAllSafetyInstructions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: myDrawer(),
      appBar: AppBar(
        title: Text(
          'ارشادات السلامة',
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: 'arabic',
          ),
        ),
      ),
      body: Container(
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
            return model.isLoading ? _bodyProgress(context) : _listViewBuilder(model);
          })),
    );
  }

  Widget _listViewBuilder(model) {
    if (model.getSafetyInstructionsList.length > 0 ||
        model.getSafetyInstructionsList.length == null) {
      return ListView.builder(
        itemCount: model.getSafetyInstructionsList.length,
        itemBuilder: (context, index) {
          return Dismissible(
              key: Key(''),
              onDismissed: (_) {},
              background: Container(color: Theme.of(context).primaryColor),
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.album),
                      title: Text(
                          model.getSafetyInstructionsList[index].MSG_Titile,
                          style: TextStyle(
                              fontFamily: 'arabic',
                              fontWeight: FontWeight.bold)),
                      subtitle: Text(
                          model.getSafetyInstructionsList[index].MSG_Text,
                          style: TextStyle(fontFamily: 'arabic')),
                    ),
                    ButtonTheme.bar(
                      child: ButtonBar(
                        children: <Widget>[
//                        FlatButton(
//                          child: const Text('BUY TICKETS'),
//                          onPressed: () {},
//                        ),
                          FlatButton(
                            child: const Text('عرض التفاصيل',
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
      return Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('لا توجد بيانات ..',
                    style: TextStyle(
                        fontFamily: 'arabic',
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 5.0,
                ),
                ButtonTheme(
                  minWidth: 250.0,
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        model.fetchAllSafetyInstructions(1);
                      });
                    },
                    color: Theme.of(context).primaryColor,
                    child: Text('تحديث',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'arabic',
                            fontSize: 18,
                            fontWeight: FontWeight.normal)),
                  ),
                ),
              ],
            ),
          ));
    }
  }


  Container _bodyProgress(context) {
    return Container(
      child: Stack(
        children: <Widget>[
          _listViewBuilder(widget.model),
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
