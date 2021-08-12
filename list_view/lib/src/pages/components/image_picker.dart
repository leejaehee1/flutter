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
      decoration: BoxDecoration(color: Colors.yellow),
      height: 200,
      // width: 1000,
      // height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            children: [
              OutlinedButton(
                onPressed: () {
                  imageSelect();
                },
                child: const Text("select Image"),
              ),
              OutlinedButton(
                onPressed: () {
                  videoSelect();
                },
                child: const Text("take Image"),
              ),
            ],
          ),

          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemCount: _imageList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.file(
                        File(_imageList[index].path),
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                          child: IconButton(
                            onPressed: () {
                              _imageList.removeAt(index);
                              setState(() {});
                            },
                            icon: Icon(Icons.delete),
                          ),
                        ),
                      )
                    ],
                  ),
                );
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
    if (selectedImage!.path.isNotEmpty) {
      _imageList.add(selectedImage);
    }

    setState(() {});
  }

  void videoSelect() async {
    final XFile? takenImage =
        await _picker.pickImage(source: ImageSource.camera);
    if (takenImage!.path.isNotEmpty) {
      _imageList.add(takenImage);
    }

    setState(() {});
  }
}
