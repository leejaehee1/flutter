import 'package:flutter/material.dart';

class ScreenTabBar extends StatelessWidget {
  final TabController tabController;
  // final onTap;
  // final VoidCallback? onTap;

  const ScreenTabBar({
    Key? key,
    required this.tabController,
    // required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      controller: tabController,
      // onTap: onTap,
      labelColor: Colors.black,
      indicatorColor: Colors.black,
      indicatorWeight: 2.0,
      unselectedLabelColor: Colors.grey,
      labelPadding: const EdgeInsets.symmetric(horizontal: 10),
      tabs: const <Widget>[
        Tab(
          child: Text(
            "1",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Tab(
          child: Text(
            "2",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Tab(
          child: Text(
            "3",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Tab(
          child: Text(
            "4",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
