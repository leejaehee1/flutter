import 'package:flutter/material.dart';

class ListComponent extends StatelessWidget {
  ListComponent({
    Key? key,
    required this.title,
    required this.data1,
    required this.data2,
    required this.colors,
  }) : super(key: key);

  final int colors;
  final String title;
  final String data1;
  final String data2;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 1 / 6,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Color(colors),
                offset: Offset(-7, 0),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Column(
                  children: [
                    Column(
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            color: Color(colors),
                          ),
                        ),
                        Text(data1),
                        Text(data2),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
