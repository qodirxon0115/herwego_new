
class Post {
  int? id;
  String? fName;
  String? lName;
  String? title;
  String? body;
  String? imgUrl;
  String? userId;

  Post({this.id, this.title, this.body, this.imgUrl, this.userId, this.fName, this.lName});

  Post.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        fName = json['fName'],
        lName = json['lName'],
        body = json['body'],
        imgUrl = json['imgUrl'],
        userId = json['userId'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'fName': fName,
    'lName': lName,
    'title': title,
    'body': body,
    'imgUrl': imgUrl,
    'userId': userId,
  };
}