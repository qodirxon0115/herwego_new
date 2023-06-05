

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:herewego/pages/create_page.dart';
import 'package:herewego/pages/services/auth_service.dart';
import 'package:herewego/pages/services/rtdb_service.dart';

import 'models/post_model.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  List<Post> item = [];

  Future _callCreatePage() async{
    Map results = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context){
          return const CreatePage();
    }));
    if(results != null && results.containsKey("data")){
      print(results['data']);
      _apiPostList();
    }
  }

  _apiPostList() async{
    setState(() {
      isLoading = true;
    });
    var list = await RTDBService.getPosts();
    item.clear();
    setState(() {
      item = list;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase"),
        actions: [
          IconButton(
            onPressed: (){
              AuthService.signOutUser(context);
            },
            icon: const Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: item.length,
            itemBuilder: (ctx, index){
              return itemOfPost(item[index]);
            },
          ),
          isLoading ? const Center(
            child: CircularProgressIndicator(),
          ) : const SizedBox.shrink(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: _callCreatePage,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget itemOfPost(Post post){
    return Slidable(
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(onDismissed: (){},),
        children: [
          SlidableAction(
            onPressed:(BuildContext context){},
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: "Update",
          )
        ],
      ),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (BuildContext context){},
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: "Delete",
          )
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(post.title!,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),),

                const SizedBox(height: 5,),

                Text(post.body!,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),),
              ],
            )
          ],
        ),
      ),
    );
  }

}
