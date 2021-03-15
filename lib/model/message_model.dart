
class MessageModel {
  String text;
  String imageUrl;
  String senderPhotoUrl = 'https://banner2.cleanpng.com/20180626/fhs/kisspng-avatar-user-computer-icons-software-developer-5b327cc98b5780.5684824215300354015708.jpg';
  String senderName = "ibrahim";

  MessageModel({this.text, this.imageUrl, this.senderPhotoUrl, this.senderName });

  Map<String, dynamic> toJson() => {
      "text" : this.text,
      "imageUrl": this.imageUrl,
      "senderPhotoUrl": this.senderPhotoUrl,
       "senderName" : this.senderName
  };

  factory MessageModel.fromJson(Map<String, dynamic> json) => itemBuilder(json);
}

MessageModel itemBuilder(Map<String, dynamic> json)
{

  print("neden buradayim");
  return MessageModel(
    text: json["text"] as String,
    imageUrl: json["imageUrl"] as String,
    senderPhotoUrl: json["senderPhotoUrl"] as String,
    senderName: json["senderName"] as String,
  );
}