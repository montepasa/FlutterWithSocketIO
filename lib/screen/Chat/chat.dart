import 'package:flutter/material.dart';
import 'package:oops/model/chat_model.dart';
import 'package:oops/screen/Chat/message.dart';
import 'package:oops/services/global.dart';

class Chat extends StatefulWidget {
  Chat() : super();
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> with TickerProviderStateMixin {
  List<String> toPrint = ["Let's Start"];
  final TextEditingController _textController = new TextEditingController();
  List<Message> messages;
  ChatModel userModel;
  bool isComposing = false;
  @override
  void initState() {
    super.initState();
    messages = List();

    userModel = Global.userModel;
    _initSocketListeners();
  }

  _initSocketListeners() async {
    //Global.socket.setOnUserConnectionStatusListener(onUserConnectionStatus);
    Global.socket.setOnChatMessageReceivedListener(onChatMessageReceived);
   // Global.socket.setOnChatNewMessageListener(onChatNewMessageListener);
    //Global.socket.setOnMessageBackFromServer(onMessageBackFromServer);
  }

  @override
  void dispose() {
    //new
    for (Message _message in messages) //new
      _message.animationController.dispose(); //new
    super.dispose(); //new
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }


  //socket.on("message", (data) {
  // _messageWriting(ChatModel.fromJson(data));
  //});

  void _textMessageSubmitted(String text) {
    _textController.text = '';
    print("oda bilgisi " + userModel.roomId);
    ChatModel _chatModel = new ChatModel(
        avatarUrl: userModel.avatarUrl,
        name: userModel.name,
        datetime: userModel.datetime,
        roomId: userModel.roomId,
        message: text,
        newMessage: true,
        );
    Global.socket.sendSingleChatMessage(_chatModel);

    //  socket.emit("message", [_chatModel.toJson()]);
  }

  onError(data) {
    print('onError $data');
  }

  onConnect(data) {
    print('Connected $data');
  }

  onDisconnect(data) {
    print('onDisconnect $data');
  }

  onConnectError(data) {
    print('onConnectError $data');
  }

  void _messageWriting(ChatModel chatModel) {
    Message message = new Message(
      chatModel: chatModel,
      animationController: new AnimationController(
        duration: new Duration(milliseconds: 350),
        vsync: this,
      ),
    );
    addMessage(message);
    message.animationController.forward();
  }

  addMessage(Message message) async {
    setState(() {
      messages.insert(0, message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: Row(children: <Widget>[
            CircleAvatar(
                radius: 20.0,
                backgroundImage: NetworkImage(userModel.avatarUrl)),
            SizedBox(width: 10),
            new Text(userModel.name),
          ]),
          leadingWidth: 30),
      body: new Column(
        children: <Widget>[
          new Flexible(
            child: new ListView.builder(
              padding: new EdgeInsets.all(0.0),
              reverse: true,
              itemBuilder: (_, int index) => messages[index],
              itemCount: messages.length,
            ),
          ),
          new Divider(height: 5.0),
          new Container(
              decoration: new BoxDecoration(color: Theme.of(context).cardColor),
              child: _buildTextComposer()),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                controller: _textController,
                onSubmitted: _textMessageSubmitted,
                decoration:
                    new InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            new Container(
              margin: new EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: () async =>
                    _textMessageSubmitted(_textController.text)
                  //modified

                  //modified
                  ),
            ),
          ],
        ),
      ),
    );
  }

    //socket end

  onChatMessageReceived(data) {
        print("*******buraya da geldim 12**********");
    _messageWriting(ChatModel.fromJson(data));
  }
}
