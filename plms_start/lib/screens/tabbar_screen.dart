import 'package:flutter/material.dart';

class CatalogTabBar extends StatefulWidget {
  final TabController tabController;
  final onTap;

  const CatalogTabBar({
    Key? key,
    required this.tabController,
    required this.onTap,
  }) : super(key: key);

  @override
  _CatalogTabBarState createState() => _CatalogTabBarState();
}

class _CatalogTabBarState extends State<CatalogTabBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 70,
      // padding: EdgeInsets.only(),

      child: TabBar(
        indicatorSize: TabBarIndicatorSize.label,
        controller: widget.tabController,
        onTap: widget.onTap,
        // labelColor: Colors.black,
        indicatorColor: Colors.white,
        indicatorWeight: 2.0,
        unselectedLabelColor: Colors.red,
        labelPadding: const EdgeInsets.symmetric(horizontal: 10),
        tabs: [
          Tab(child: Image.asset('assets/images/tab_one.png')),
          Tab(
              child: widget.tabController.index >
                      widget.tabController.previousIndex
                  ? Image.asset('assets/images/tab_two_click.png')
                  : Image.asset('assets/images/tab_two.png')),
          Tab(
            child:
                widget.tabController.index > widget.tabController.previousIndex
                    ? Image.asset('assets/images/tab_three.png')
                    : Image.asset('assets/images/tab_three_click.png'),
          ),
        ],
      ),
    );
  }
}
