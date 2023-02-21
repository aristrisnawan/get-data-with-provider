import 'package:d_method/d_method.dart';
import 'package:flutter/material.dart';
import 'package:get_data_provider/provider/post_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  // final postProvider = Provider.of<PostProvider>(context, listen: false);
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<PostProvider>(context,listen: false).fetchData();
    });
  }
  Widget build(BuildContext context) {
    return Consumer<PostProvider>(builder: ((context, value, child) {
      // DMethod.printTitle("ripus", value.fetchData().toString());
      if (value.posts.isEmpty) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return ListView.builder(
            itemCount: value.posts.length,
            itemBuilder: ((context, index) {
              final post = value.posts[index];
              return ListTile(
                title: Text(post.title),
                subtitle: Text(post.body),
              );
            }));
      }
    }));
  }
}
