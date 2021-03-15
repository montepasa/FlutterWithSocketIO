class ChatModel {
   String avatarUrl;
   String name;
   String datetime;
   String message;
   String roomId;
   bool newMessage;

  ChatModel({this.avatarUrl, this.name, this.datetime, this.message, this.roomId, this.newMessage});

  static final List<ChatModel> dummyData = [
    ChatModel(
      avatarUrl: "https://pbs.twimg.com/profile_images/1362765420999176194/V_5tgPZ3_400x400.jpg",
      name: "Laurent",
      datetime: "20:18",
      message: "Hi Whatsup?",
      roomId:"1",
      newMessage: false
    ),
    ChatModel(
      avatarUrl: "https://pbs.twimg.com/profile_images/1362765420999176194/V_5tgPZ3_400x400.jpg",
      name: "Tracy",
      datetime: "19:22",
      message: "I love that idea, it's great!",
      roomId:"2",
      newMessage: false
    ),
    ChatModel(
      avatarUrl: "https://pbs.twimg.com/profile_images/1362765420999176194/V_5tgPZ3_400x400.jpg",
      name: "Claire",
      datetime: "14:34",
      message: "I wasn't aware of that. Let me check",
      roomId:"3",
       newMessage: false
    ),
    ChatModel(
      avatarUrl: "https://pbs.twimg.com/profile_images/1362765420999176194/V_5tgPZ3_400x400.jpg",
      name: "Joe",
      datetime: "11:05",
      message: "Flutter just release 1.0 officially. Should I go for it?",
      roomId:"4",
       newMessage: false
    ),
    ChatModel(
      avatarUrl: "https://pbs.twimg.com/profile_images/1362765420999176194/V_5tgPZ3_400x400.jpg",
      name: "Mark",
      datetime: "09:46",
      message: "It totally makes sense to get some extra day-off.",
      roomId:"5",
       newMessage: false
    ),
    ChatModel(
      avatarUrl: "https://pbs.twimg.com/profile_images/1362765420999176194/V_5tgPZ3_400x400.jpg",
      name: "Williams",
      datetime: "08:15",
      message: "It has been re-scheduled to next Saturday 7.30pm",
      roomId:"6",
       newMessage: false
    ),
    ChatModel(
      avatarUrl: "https://pbs.twimg.com/profile_images/1362765420999176194/V_5tgPZ3_400x400.jpg",
      name: "Kemal",
      datetime: "09:46",
      message: "Ben geldim yoktunuz.",
      roomId:"7",
       newMessage: false
    ),
    ChatModel(
        avatarUrl: "https://pbs.twimg.com/profile_images/1362765420999176194/V_5tgPZ3_400x400.jpg",
        name: "Hakan",
        datetime: "08:15",
        message: "Yarın ne yapıyorsun?",
        roomId:"8",
         newMessage: false
        ),
    ChatModel(
      avatarUrl: "https://pbs.twimg.com/profile_images/1362765420999176194/V_5tgPZ3_400x400.jpg",
      name: "Osman",
      datetime: "08:15",
      message: "Eve geç geleceğim orda mısın?",
      roomId:"9",
       newMessage: false
    ),
  ];

  Map<String, dynamic> toJson() => {
        "avatarUrl": this.avatarUrl,
        "name": this.name,
        "datetime": this.datetime,
        "message": this.message,
        "roomId": this.roomId,
      };

  factory ChatModel.fromJson(Map<String, dynamic> json) => itemBuilder(json);
}

 ChatModel itemBuilder(Map<String, dynamic> json) {
    return ChatModel(
        avatarUrl: json["avatarUrl"] as String,
        name: json["name"] as String,
        datetime: json["datetime"] as String,
        message: json["message"] as String,
        roomId: json["roomId"] as String);
 }