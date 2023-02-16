import 'dart:convert';

import 'package:d_method/d_method.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_data_provider/model/model_posts.dart';
import 'package:http/http.dart' as http;

class PostProvider extends ChangeNotifier {
  List<PostModel> _posts = [];
  List<PostModel> get posts => _posts;
  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    final List<dynamic> data = json.decode(response.body);
    _posts = data.map((json) => PostModel.fromJson(json)).toList();
    DMethod.printTitle("title", _posts.toString());

    notifyListeners();
  }
}
