import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:plms_start/punch_issue/punch_issue.dart';
import '../globals/login.dart' as login;
import '../globals/photos.dart' as photos;
import 'punch_photo.dart';
/*
* name : Loading
* description : Loading page
* writer : walter
* create date : 2021-09-30
* last update : 2021-09-30
* */

class LoadingPhoto extends StatefulWidget {
  const LoadingPhoto({Key? key}) : super(key: key);

  @override
  _LoadingPhotoState createState() => _LoadingPhotoState();
}

class _LoadingPhotoState extends State<LoadingPhoto> {
  var api = dotenv.env['PHONE_IP'];
  // var api = dotenv.env['EMUL_IP'];

  @override
  void initState() {
    print('strat');
    photos.photos_Punch_ID = [];
    photos.photos_Punch_Step = [];
    photos.photos_Local_Path = [];
    photos.photos_Image_Path = [];
    photos.photos_category = [];
    photos.photos_discipline = [];
    photos.photos_unit = [];
    photos.photos_area = [];
    photos.photos_systemName = [];
    photos.photos_data = [];

    test();
    print('end');
    super.initState();
  }

  // get data
  Future<dynamic> test() async {
    print('object');
    var url = Uri.parse('$api/summury/loadpunch/');
    for (var i = 0; i < photos.photos_Punch_ID.length; i++) {
      var response = await http.post(url, body: {
        'punchID': photos.photos_Punch_ID[i],
        'userID': login.userID[0],
      });
      var loadPunch = jsonDecode(response.body);
      if (loadPunch.length != 0) {
        photos.photos_data += loadPunch;
      }
      print('HI!!!!!!!');
      Get.off(
        () => PhotoList(),
      );
      print('bye!!!!!!!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(opacity: 1);
  }
}
