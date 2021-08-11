import 'package:flutter/material.dart';

class CatalogTabBar extends StatefulWidget {
  const CatalogTabBar({Key? key}) : super(key: key);

  @override
  State<CatalogTabBar> createState() => _CatalogTabBarState();
}

/// This is the private State class that goes with MyStatefulWidget.
/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _CatalogTabBarState extends State<CatalogTabBar>
    with TickerProviderStateMixin {
  late final TabController tabController;
  late final Function onTap;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
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
      ],
    );
  }
}
