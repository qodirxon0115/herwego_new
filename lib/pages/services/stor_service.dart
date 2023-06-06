

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StoreService{
  static final _storage = FirebaseStorage.instance.ref();
  static const folder = "post_image";

  static Future<String> uploadImage(File image) async{
    String imgName =  "image_${DateTime.now()}";
    var firebaseStoreRef = _storage.child(folder).child(imgName);
    var uploadTask = firebaseStoreRef.putFile(image);
    final TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => {});
    String downloadUrl = await firebaseStoreRef.getDownloadURL();
    return downloadUrl;
    print(downloadUrl);
  }
}