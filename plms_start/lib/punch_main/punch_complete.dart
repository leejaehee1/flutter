import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:image_picker/image_picker.dart';

import 'package:plms_start/punch_issue/image_painter.dart';
import 'package:plms_start/pages/utils/header_issue.dart';
import 'package:plms_start/pages/utils/title_text.dart';
import '../globals/login.dart' as login;
/*
* name : PunchComplete Page
* description : complete page
* writer : walter
* create date : 2021-09-30
* last update : 2021-09-30
* */

class PunchComplete extends StatefulWidget {
  const PunchComplete({Key? key}) : super(key: key);

  @override
  _PunchCompleteState createState() => _PunchCompleteState();
}

class _PunchCompleteState extends State<PunchComplete> {
  var api = dotenv.env['PHONE_IP'];
  // var api = dotenv.env['EMUL_IP'];

  var data = Get.arguments[0];
  var id = login.userID[0];
  var password = login.password[0];
  var userName = login.userName[0];
  var email = login.email[0];
  var company = login.company[0];
  var authority = login.authority[0];
  var personalID = login.personalID[0];
  var department = login.department[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2B3745),
        automaticallyImplyLeading: false,
        title: Header(
          title: AppLocalizations.of(context)!.completeTitle,
        ),
      ),
      body: Column(
        children: [
          Container(
            // height: MediaQuery.of(context).size.height * 1.45 / 7,
            width: MediaQuery.of(context).size.width,
            color: Color(0xFFE6E6E6),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Container(
                color: Color(0xff2B3745),
                // height: 30,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: _completeComponent(),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Container(
                  color: Color(0xFFE6E6E6),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xffB7C5B9),
                            offset: Offset(-7, 0),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                TitleText(
                                  title: AppLocalizations.of(context)!
                                      .completePageTitle,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            _imagePicker(),
                            SizedBox(
                              height: 20,
                            ),
                            _description(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Color(0xFFE6E6E6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: Get.width * 2.8 / 7,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff71838D), // background
                  // onPrimary: Colors.white, // foreground
                ),
                onPressed: () {
                  Get.back();
                },
                child: Text(AppLocalizations.of(context)!.completePageButton1),
              ),
            ),
            SizedBox(
              width: Get.width * 2.8 / 7,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff2F4C5A), // background
                  // onPrimary: Colors.white, // foreground
                ),
                onPressed: () async {
                  // print(id);
                  // print(data['projectID']);
                  // print(data['punchID']);
                  // print(DateTime.now());

                  var url = Uri.parse('$api/summury/complete');
                  await http.post(url, body: {
                    'userID': id,
                    'projectID': data['projectID'],
                    'punchID': data['punchID'],
                    'completedDate': DateTime.now().toString(),
                  });
                  print('성공이욤');

                  Get.offAllNamed(
                    '/home',
                    //  arguments: [
                    //   authority,
                    //   id,
                    //   password,
                    //   userName,
                    //   email,
                    //   company,
                    //   personalID,
                    //   department
                    // ]
                  );
                },
                child: Text(AppLocalizations.of(context)!.completePageButton2),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 사진 카메라에서 이미지 선택
  final ImagePicker _picker = ImagePicker();
  List<XFile> _imageList = [];
  late XFile value = Get.to(ImagePainters()) as XFile;
  bool status = false;
  // double len = [].length as double;
  Widget _imagePicker() {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      height: 250,
      // width: 1000,
      // height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          _swichWidget('Upload Images now'),
          // SwitchButton(name: 'Upload Images now'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Photo'),
              IconButton(
                  onPressed: () {
                    setState(() {
                      _showDialog2();
                    });
                  },
                  icon: Icon(Icons.add_a_photo)),
              // IconButton(
              //     onPressed: () {
              //       setState(() {
              //         print("value다!!!!!!!: $value");
              //         _imageList.add(value);
              //         print("된다");
              //       });
              //     },
              //     icon: Icon(Icons.check)),
            ],
          ),

          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemCount: _imageList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      InkWell(
                        onTap: () {
                          print('hi');
                          // _imagePainter(index);
                          Get.to(() => ImagePainters(),
                              arguments: _imageList[index].path);

                          print('hihi');
                        },
                        child: Image.file(
                          File(_imageList[index].path),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                          child: IconButton(
                            onPressed: () {
                              _showDialog(index);
                            },
                            icon: Icon(Icons.delete),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  //스위치 버튼
  Widget _swichWidget(String name) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name),
        FlutterSwitch(
          activeColor: Colors.green,
          width: 40.0,
          height: 20.0,
          valueFontSize: 10.0,
          toggleSize: 10.0,
          value: status,
          borderRadius: 30.0,
          // padding: 3.0,
          showOnOff: true,
          onToggle: (val) {
            setState(() {
              status = val;
            });
          },
        ),
      ],
    );
  }

  // 갤러리 카메라 선택 다이얼로그
  void _showDialog2() {
    double _imageSize = Get.width * 1 / 11;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: <Widget>[
            Column(
              children: [
                TextButton(
                  onPressed: () {
                    imageSelect();
                    Get.back();
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/gallery_button.png',
                        height: _imageSize,
                        width: _imageSize,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Open Gallery",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    videoSelect();
                    Get.back();
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/camera_button.png',
                        height: _imageSize,
                        width: _imageSize,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Open Camera",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }

  // 삭제 다이얼로그
  void _showDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: new Text("Are you sure you want to Delete?"),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                new ElevatedButton(
                  child: new Text("No"),
                  onPressed: () {
                    Get.back();
                  },
                ),
                new ElevatedButton(
                  child: new Text("Yes"),
                  onPressed: () {
                    _imageList.removeAt(index);
                    setState(() {});
                    Get.back();
                  },
                ),
              ],
            )
          ],
        );
      },
    );
  }

  // 갤러리 이미지 선택
  void imageSelect() async {
    final XFile? selectedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    try {
      if (selectedImage!.path.isNotEmpty) {
        _imageList.add(selectedImage);
        print(selectedImage.runtimeType);
      }
      setState(() {});
    } catch (e) {}
  }

  // 카메라 이미지 선택
  void videoSelect() async {
    final XFile? takenImage =
        await _picker.pickImage(source: ImageSource.camera);
    try {
      if (takenImage!.path.isNotEmpty) {
        _imageList.add(takenImage);
      }
      setState(() {});
    } catch (e) {}
  }

  // description
  Widget _description() {
    return Column(
      children: [
        Row(
          children: [
            Text(AppLocalizations.of(context)!.completePageDescription),
          ],
        ),
        TextField(
            maxLines: 7,
            keyboardType: TextInputType.multiline,
            maxLength: null,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText:
                  AppLocalizations.of(context)!.completePageDescriptionLabel,
              isDense: true,
            )),
      ],
    );
  }

  // app bar data
  Widget _completeComponent() {
    return Column(
      children: [
        _dataWidget('PunchID', data['punchID']),
        _dataWidget('Category', data['category']),
        SizedBox(
          width: 20,
        ),
        _dataWidget('Area', data['area']),
        SizedBox(
          width: 20,
        ),
        _dataWidget('Unit', data['unit']),
        _dataWidget('Tag Number', data['tagNumber']),
        _dataWidget('System', data['systemName']),
        _dataWidget('Sub-system', data['subsystemName']),
        SizedBox(
          height: 10,
        ),
        Container(
          width: 500,
          child: Divider(
            color: Color(0xff5D8791),
            thickness: 1.3,
          ),
        ),
        Row(
          children: [
            Flexible(
              child: Text(
                data['notAcceptComment'],
                style: TextStyle(color: Color(0xff5D8791)),
                overflow: TextOverflow.fade,
              ),
            ),
          ],
        )
      ],
    );
  }

  // data text widget
  Widget _dataWidget(String title, String datas) {
    return Row(
      children: [
        SizedBox(
          width: Get.width * 2 / 7,
          // height: Get.height * 1 / 11,
          child: Text(
            title,
            style: TextStyle(color: Colors.white60, fontSize: 13),
          ),
        ),
        Flexible(
          child: Text(
            datas,
            style: TextStyle(color: Colors.white, fontSize: 13),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
