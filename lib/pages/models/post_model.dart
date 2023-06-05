
class Post {
  int? id;
  String? title;
  String? body;
  String? imgUrl;
  String? userId;

  Post({this.id, this.title, this.body, this.imgUrl, this.userId});

  Post.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        body = json['body'],
        imgUrl = json['imgUrl'],
        userId = json['userId'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'body': body,
    'imgUrl': imgUrl,
    'userId': userId,
  };
}