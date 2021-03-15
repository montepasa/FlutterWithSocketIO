import 'package:oops/model/chat_model.dart';
import 'package:oops/services/socket.dart';

class Global {
  // Socket
  static Socket socket;
  static ChatModel userModel;
  static initSocket() {
    print("buraya geldim");
    if (null == socket) {
      print("buraya da girdim");
      socket = new Socket();
    }
  }
}
