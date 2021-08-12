import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickers extends StatefulWidget {
  const ImagePickers({Key? key}) : super(key: key);

  @override
  _ImagePickersState createState() => _ImagePickersState();
}

class _ImagePickersState extends State<ImagePickers> {
  final ImagePicker _picker = ImagePicker();
  List<XFile> _imageList = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1000,
      width: 1000,
      child: Column(
        children: [
          OutlinedButton(
              onPressed: () {
                imageSelect();
              },
              child: const Text("select Image")),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemCount: _imageList.length,
              itemBuilder: (BuildContext context, int index) {
                return Image.file(File(_imageList[index].path));
                // return Text("data");
              },
            ),
          ),

          // InkWell(
          //   onTap: () {
          //     imageSelect();
          //   },
          //   child: Container(
          //       height: 100,
          //       width: 100,
          //       decoration: BoxDecoration(
          //           border: Border.all(
          //               color: Colors.black, style: BorderStyle.solid, width: 1)),
          //       child: Icon(Icons.add)),
          // ),
        ],
      ),
    );
  }

  void imageSelect() async {
    final XFile? selectedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (selectedImage!.path.isEmpty) {
      _imageList.add(selectedImage);
    }
    print(_imageList);
    print(selectedImage);
    print(selectedImage.path.toString());
    print('hi');
    setState(() {});
    print('hihihi');
    print(_imageList);
  }
}
