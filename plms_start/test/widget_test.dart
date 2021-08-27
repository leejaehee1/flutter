// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';

// import 'package:plms_start/main.dart';
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

Future<void> main() async {
  var uriResponse = await http.get(
    Uri.parse(
      'http://localhost:5000/api/',
    ),
  );

  var json = jsonDecode(uriResponse.body);
  // print(json);

  // Map userMap = jsonDecode(json);
  // var user = User.fromJson(json);

  // print('category, ${user.category}!');
  // print('categoryName ${user.categoryName}.');
  // print(uriResponse);
  print(json);
  // print('result: ${user.result[0]['category']}');
  // print('test ${user.test}.');
  // print('error ${user.error}.');
}

class User {
  final List result;
  final String? test;
  final String? error;

  User({required this.result, required this.test, required this.error});

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['result'] as List<dynamic>;
    // print("LIST!!!!!!!! : $list");
    print(list[0]["categoryName"]);
    print(list.runtimeType);
    List<Result> resultList = list.map((i) => Result.fromJson(i)).toList();
    print("resultList!!!!!!!! : $resultList");
    print(resultList[0]);
    return User(
      // result: Result.fromJson(parsedJson["result"]),
      result: list,
      test: parsedJson['test'],
      error: parsedJson['error'],
    );
  }
}

class Result {
  final String? category;
  final String? categoryName;
  final String? stage;

  Result(
      {required this.category,
      required this.categoryName,
      required this.stage});

  factory Result.fromJson(Map<String, dynamic> parsedJson) {
    return Result(
      category: parsedJson["category"],
      categoryName: parsedJson['categoryName'],
      stage: parsedJson['stage'],
    );
  }
}
