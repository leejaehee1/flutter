import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import 'package:image_painter/image_painter.dart';

class ImagePainters extends StatefulWidget {
  @override
  _ImagePaintersState createState() => _ImagePaintersState();
}

class _ImagePaintersState extends State<ImagePainters> {
  final _imageKey = GlobalKey<ImagePainterState>();
  final _key = GlobalKey<ScaffoldState>();

  String imageData = Get.arguments;

  void saveImage() async {
    final image = await _imageKey.currentState!.exportImage();
    final directory = (await getApplicationDocumentsDirectory()).path;
    await Directory('$directory/sample').create(recursive: true);
    final fullPath =
        '$directory/sample/${DateTime.now().millisecondsSinceEpoch}.png';
    final imgFile = File('$fullPath');
    imgFile.writeAsBytesSync(image!);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.grey[700],
        padding: const EdgeInsets.only(left: 10),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Image Exported successfully.",
                style: TextStyle(color: Colors.white)),
            TextButton(
                onPressed: () => OpenFile.open("$fullPath"),
                child: Text("Open", style: TextStyle(color: Colors.blue[200])))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
        appBar: AppBar(
          title: const Text("Image Painter Example"),
          actions: [
            IconButton(
              icon: const Icon(Icons.save_alt),
              onPressed: () {
                print('hi');
              },
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
