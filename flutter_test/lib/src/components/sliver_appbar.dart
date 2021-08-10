import 'package:flutter/material.dart';

class CatalogAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        children: [
          IconButton(
            color: Colors.black,
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios),
          ),
          Text(
            'Punch Issue',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
