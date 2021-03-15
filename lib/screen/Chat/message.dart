import 'package:flutter/material.dart';
import 'package:oops/model/chat_model.dart';

class Message extends StatelessWidget {
  
  ChatModel chatModel;
  Message({this.chatModel, this.animationController});
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    final mWidth = MediaQuery.of(context).size.width;
    final width = chatModel.message.length > mWidth / 7 ? mWidth / 2 : null;
    return new SizeTransition(
        //new
        sizeFactor: new CurvedAnimation(
            //new
            parent: animationController,
            curve: Curves.easeOut), //new
        child: new Container(
          margin: const EdgeInsets.symmetric(vertical: 2.0),
          child: new Row(
              mainAxisAlignment: false == true
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: false == true
                  ? getMyMessageLayout(width)
                  : getReceivedMessageLayout(width)),
        ) //new
        );
  }

  List<Widget> getMyMessageLayout(width) {
    return <Widget>[
      new Container(
        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
        decoration: BoxDecoration(
          color: Colors.green[10],
          borderRadius: BorderRadius.circular(15),
        ),
        child: new Container(
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(chatModel.name,
                  style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              new Container(
                // margin:  const EdgeInsets.only(top:5.0),
                child: new Text(chatModel.message),
              ),
            ],
          ),
        ),
      ),
    ];
  }

  getReceivedMessageLayout(width) {
    return <Widget>[
      new Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
        decoration: BoxDecoration(
          color: Colors.purple[100],
          borderRadius: BorderRadius.circular(15),
        ),
        child: new Container(
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(chatModel.name,
                  style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              new Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: new Text(chatModel.message),
              ),
            ],
          ),
        ),
      ),
    ];
  }
}
