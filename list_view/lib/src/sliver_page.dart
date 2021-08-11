import 'package:flutter/material.dart';
import 'package:list_view/src/components/sliver_appbar.dart';
import 'package:list_view/src/components/sliver_page_three.dart';

import 'components/sliver_page_one.dart';
import 'components/sliver_page_two.dart';
import 'components/sliver_tabbar.dart';

class SliverPage extends StatefulWidget {
  const SliverPage({Key? key}) : super(key: key);

  @override
  _SliverPageState createState() => _SliverPageState();
}

class _SliverPageState extends State<SliverPage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            // expandedHeight: 100,
            floating: true,
            pinned: true,
            backgroundColor: Colors.blue,
            title: CatalogAppBar(),
          ),
          SliverAppBar(
            // expandedHeight: 0,
            elevation: 0,
            pinned: true,
            // titleSpacing: 0,
            backgroundColor: Colors.red,
            title: CatalogTabBar(
              tabController: _tabController,
              // onTap: ,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                PageOne(),
                PageTwo(),
                PageThree(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
