
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:herewego/pages/models/post_model.dart';
import 'package:herewego/pages/services/auth_service.dart';
import 'package:herewego/pages/services/rtdb_service.dart';
import 'package:herewego/pages/services/stor_service.dart';
import 'package:image_picker/image_picker.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  var isLoading = false;
  var fNameController = TextEditingController();
  var lNameController = TextEditingController();
  var titleController = TextEditingController();
  var contentController = TextEditingController();

  File? image;
  final picker = ImagePicker();

  void _createPost() async{
    String fName = fNameController.text.toString();
    String lName = lNameController.text.toString();
    String title = titleController.text.toString();
    String body = contentController.text.toString();
    if(title.isEmpty || body.isEmpty) return;
    if(image == null) return;

    apiUploadImage(title, body, fName, lName);
  }

  apiUploadImage(String title, String body,String fName,String lName){
    setState(() {
      isLoading = true;
    });
    StoreService.uploadImage(image!).then((imgUrl) => {
      _apiCreatePost(title, body, imgUrl, fName, lName),
    });
  }

  _apiCreatePost(String title, String body, String imgUrl, String fName, String lName){
    setState(() {
      isLoading = true;
    });
    var post = Post(title: title, body: body, imgUrl: imgUrl,fName: fName, lName: lName,
        userId: AuthService.currentUserId());
    RTDBService.addPost(post).then((value) => {
      _resAddPost(),
    });
  }

  void _resAddPost(){
    setState(() {
      isLoading = false;
    });
    Navigator.of(context).pop({'data' : 'done'});
  }

  void _getImage() async{
    // ignore: deprecated_member_use
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if(pickedFile != null){
        image = File(pickedFile.path);
      }else{
        print("No image selected");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create a Post"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  const SizedBox(height: 15,),

                  GestureDetector(
                    onTap: _getImage,
                    child: Container(
                      height: 140,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: image != null
                          ? Image.file(image!, fit: BoxFit.cover,)
                          :Image.asset("assets/images/ic_camera.jpg"),
                    ),
                  ),

                  const SizedBox(height: 15,),

                  TextField(
                    controller: fNameController,
                    decoration: const InputDecoration(
                        hintText: "First name"
                    ),
                  ),

                  const SizedBox(height: 10,),

                  TextField(
                    controller: lNameController,
                    decoration: const InputDecoration(
                        hintText: "Last name"
                    ),
                  ),

                  const SizedBox(height: 10,),

                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                        hintText: "Date"
                    ),
                  ),

                  const SizedBox(height: 10,),

                  TextField(
                    controller: contentController,
                    decoration: const InputDecoration(
                        hintText: "Content"
                    ),
                  ),

                  const SizedBox(height: 15,),

                  MaterialButton(
                    onPressed: (){
                      _createPost();
                    },
                    color: Colors.blue,
                    child: const Text('Create', style: TextStyle(color: Colors.white),),
                  ),
                ],
              )
            ],
          ),
        )
      ),
    );
  }
}
