import 'package:flutter/material.dart';
import 'package:get/get.dart';

/*
* name : CatalogAppBar Page
* description : app bar page
* writer : walter
* create date : 2021-09-30
* last update : 2021-09-30
* */

class CatalogAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
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
          ElevatedButton(
            onPressed: () {
              Get.offAllNamed('/');
            },
            child: Text('Logout'),
            style: ElevatedButton.styleFrom(
              primary: Color(0xff5C8893),
            ),
          ),
        ],
      ),
    );
  }
}
