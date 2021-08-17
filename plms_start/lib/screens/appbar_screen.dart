import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatalogAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        children: [
          IconButton(
            color: Colors.green,
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new_sharp),
          ),
          Text(
            'Punch Issue',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
