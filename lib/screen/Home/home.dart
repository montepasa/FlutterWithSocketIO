import 'package:flutter/material.dart';
import 'package:oops/model/chat_model.dart';
import 'package:oops/model/user_model.dart';
import 'package:oops/screen/Chat/chat.dart';
import 'package:oops/services/auth.dart';
import 'package:oops/services/global.dart';
import 'package:page_transition/page_transition.dart';

class Home extends StatefulWidget {
  Home({Key key, this.auth, this.logoutCallBack, this.user}) : super(key: key);
  final Auth auth;
  final UserModel user;
  final VoidCallback logoutCallBack;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
   List<ChatModel> chatData = ChatModel.dummyData.toList();
  @override
  void initState() {
    super.initState();
   _initSocketListeners();
  }

  
  @override
  void dispose() {
    //new
    super.dispose(); //new
  }


  _initSocketListeners() async {
    Future.delayed(Duration(seconds: 2), () async {
    print("Connecting Logged In User");
    Global.initSocket();  
    await Global.socket.initSocket();
    Global.socket.connectToSocket();
    Global.socket.setConnectListener(onConnect);
    Global.socket.setOnDisconnectListener(onDisconnect);
    Global.socket.setOnErrorListener(onError);
    Global.socket.setOnConnectionErrorListener(onConnectError);
    Global.socket.setOnChatMessageReceivedListener(onChatMessageReceived);
    
    });

  }
onError(data) {
    print('onError $data');
  }
  onDisconnect(data) {
    print('onDisconnect $data');
  }
   onConnectError(data) {
    print('onConnectError $data');
  }

    onConnect(data) {
    print('onConnected $data');
  }
   onChatMessageReceived(data) {
    ChatModel dataModel =  ChatModel.fromJson(data);
     setState(() {
       chatData[0].newMessage = !chatData[0].newMessage;
       chatData[0].message = dataModel.message.trim();
     });
     print('***********************************merhaba***********************************');
     }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: new Center(child: Text("Messages"))),
      body: Container(
          color: Colors.white,
          child: ListView.builder(
              itemCount: chatData.length,
              itemBuilder: (context, index) {
                ChatModel _model = chatData[index];
                return GestureDetector(
                  onTap: () {
                    Global.userModel = _model;
                    Navigator.push(context, PageTransition(type: PageTransitionType.leftToRightWithFade, child: Chat()));
                    },
                  child: Column(
                    children: <Widget>[
                      Divider(height: 12.0),
                      ListTile(
                        leading: CircleAvatar(
                            radius: 24.0,
                            backgroundImage: NetworkImage(_model.avatarUrl)),
                        title: Row(
                          children: <Widget>[
                            Text(_model.name),
                            SizedBox(width: 16.0),
                            Text(_model.datetime,
                                style: TextStyle(fontSize: 12.0))
                          ],
                        ),
                        subtitle: _model.newMessage ? Text(_model.message, style: TextStyle(fontWeight: FontWeight.bold)): Text(_model.message),
                        trailing: Padding(
                          child: 
                              _model.newMessage ? Icon(Icons.circle, size: 14.0, color: Colors.red): SizedBox(),
                            // Icon(Icons.arrow_forward_ios, size: 14.0)
                          padding: const EdgeInsets.all(8.0),
                        )
                      )
                    ],
                  ),
                );
              })),
    );
  }
}
