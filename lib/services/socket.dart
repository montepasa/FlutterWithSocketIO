import 'package:adhara_socket_io/adhara_socket_io.dart';
import 'package:oops/model/chat_model.dart';

class Socket {
  SocketIO _socket;
  SocketIOManager _manager;

  Socket() {
    _init();
  }

  initSocket() async {
   await _init();
  }

  _init() async {
    _manager = SocketIOManager();
    _socket = await _manager.createInstance(SocketOptions(
        //Socket IO server URI
        "http://192.168.1.11:3000/",
        enableLogging: true,
        nameSpace: "/",
        transports: [
          Transports.WEB_SOCKET,
          Transports.POLLING
        ] //Enable required transport
        ));

     _socket.isConnected().then((value) => _socket.connect());
  }

  
connectToSocket() {
    if (null == _socket) {
      print("Socket is Null");
      return;
    }

    _socket.isConnected().then((value) => {
 if(!value) 
  _socket.connect()
    });
    print("Connecting to socket...");
   
}

  setConnectListener(Function onConnect) {
    _socket.onConnect((data) {
      onConnect(data);
    });
  }

  setOnConnectionErrorListener(Function onConnectError) {
    _socket.onConnectError((data) {
      onConnectError(data);
    });
  }

  setOnConnectionErrorTimeOutListener(Function onConnectTimeout) {
    _socket.onConnectTimeout((data) {
      onConnectTimeout(data);
    });
  }

  setOnErrorListener(Function onError) {
    _socket.onError((error) {
      onError(error);
    });
  }

  setOnDisconnectListener(Function onDisconnect) {
    _socket.onDisconnect((data) {
      print("onDisconnect $data");
      onDisconnect(data);
    });
  }

  closeConnection() {
    if (null != _socket) {
      print("Close Connection");
      _manager.clearInstance(_socket);
    }
  }

  sendSingleChatMessage(ChatModel _chatModel) {
    if (null == _socket) {
      print("Socket is Null, Cannot send message");
      return;
    }
    _socket.emit("message", [_chatModel.toJson()]);
  }

  setOnChatNewMessageListener(Function onChatNewMessageListener) {
    _socket.on("newmessage", (data) {
      print("/////////*****r***************BEN GELDİM ******************///////////");
      onChatNewMessageListener(data);
    });
  }
setOnChatMessageReceivedListener(Function onChatMessageReceived) {
    _socket.on("message", (data) {
      
      print("Received $data");
      onChatMessageReceived(data);
     // _socket.emit("newmessage", data);
    }); 
  }
}
