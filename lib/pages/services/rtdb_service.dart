
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:herewego/pages/models/post_model.dart';

class RTDBService{

  static final _database = FirebaseDatabase.instance.ref();

  static Future<Stream<DatabaseEvent>> addPost(Post post) async{
    _database.child('posts').push().set(post.toJson());
    return _database.onChildAdded;
  }

  static Future<List<Post>> getPosts() async{
    List<Post> items = [];
    Query query = _database.child('posts');
    DatabaseEvent event = await query.once();
    var snapshot = event.snapshot;

    for(var child in snapshot.children){
      var jsonPost = jsonEncode(child.value);
      Map<String, dynamic> map = jsonDecode(jsonPost);
      var post = Post(title: map['title'], body: map['body'], fName: map['fName'], lName: map['lName'],
          imgUrl: map['imgUrl'], userId: map['userId']);
      items.add(post);
    }
    return items;
  }

}