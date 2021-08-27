import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:plms_start/screens/models/model.dart';

import 'dart:convert';

class PostProvider with ChangeNotifier {
  List<User> _posts = [];

  List<User> getPostList() {
    _fetchPosts();
    return _posts;
  }

  void _fetchPosts() async {
    final response = await http.get(
      Uri.parse(
        'http://10.0.2.2:5000/api/category/',
      ),
    );
    final List<User> parsedResponse = jsonDecode(response.body)
        .map<User>((json) => User.fromJson(json))
        .toList();

    _posts.clear();
    _posts.addAll(parsedResponse);

    notifyListeners();
  }
}
