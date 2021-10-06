import 'dart:io';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_painter/image_painter.dart';

import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

/*
* name : ImagePainters
* description : image painter page
* writer : walter
* create date : 2021-09-30
* last update : 2021-09-30
* */

class ImagePainters extends StatefulWidget {
  @override
  _ImagePaintersState createState() => _ImagePaintersState();
}

class _ImagePaintersState extends State<ImagePainters> {
  final _imageKey = GlobalKey<ImagePainterState>();
  final _key = GlobalKey<ScaffoldState>();

  String imageData = Get.arguments;
  List _imageList = [];
  // double _loadingcount = 0;
  //이미지 저장
//   void saveImage() async {
//     final image = await _imageKey.currentState!.exportImage();
//     final directory = (await getApplicationSupportDirectory()).path;
//     await Directory('$directory/sample').create(recursive: true);
//     final fullPath =
//         '$directory/sample/${DateTime.now().millisecondsSinceEpoch}.png';
//     final imgFile = File('$fullPath');
//     imgFile.writeAsBytesSync(image!);
//     print(fullPath.runtimeType);
//     print(imgFile);
//     _imageList.add(imgFile);
//     Get.back();

//     print('간다!');
// // 저장 알림 스낵바
//     // ScaffoldMessenger.of(context).showSnackBar(
//     //   SnackBar(
//     //     backgroundColor: Colors.grey[700],
//     //     padding: const EdgeInsets.only(left: 10),
//     //     content: Row(
//     //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     //       children: [
//     //         const Text("Image Exported successfully.",
//     //             style: TextStyle(color: Colors.white)),
//     //       ],
//     //     ),
//     //   ),
//     // );
//     Get.back(result: _imageList[0]);
//   }

  void saveImage() async {
    final image = await _imageKey.currentState!.exportImage();
    final directory = (await getExternalStorageDirectory())!.path;
    await Directory('$directory/sample').create(recursive: true);
    final fullPath =
        '$directory/sample/${DateTime.now().millisecondsSinceEpoch}.png';
    final imgFile = File('$fullPath');
    imgFile.writeAsBytesSync(image!);
    print(fullPath.runtimeType);
    print(imgFile);
    _imageList.add(imgFile);
    Get.back();

    print('간다!');
// 저장 알림 스낵바
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     backgroundColor: Colors.grey[700],
    //     padding: const EdgeInsets.only(left: 10),
    //     content: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         const Text("Image Exported successfully.",
    //             style: TextStyle(color: Colors.white)),
    //       ],
    //     ),
    //   ),
    // );
    Get.back(result: _imageList[0]);
  }

  void _onLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: new Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              new CircularProgressIndicator(),
              new Text("Loading"),
            ],
          ),
        );
      },
    );
  }

  void _printText() async {
    // final directory = (await getApplicationSupportDirectory()).path;
    final directory = (await getExternalStorageDirectory())!.path;
    print(directory);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
        appBar: AppBar(
          title: const Text("Image Painter Example"),
          actions: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.save_alt),
                  onPressed: () {
                    _onLoading();
                    saveImage();
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.save),
                  onPressed: () {
                    _printText();
                  },
                ),
              ],
            )
          ],
        ),
        body: ImagePainter.file(
          File(imageData),
          key: _imageKey,
          initialPaintMode: PaintMode.rect,
        ));
  }
}
