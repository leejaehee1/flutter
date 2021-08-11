import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'components/sliver_appbar.dart';
import 'components/sliver_page_one.dart';
import 'components/sliver_page_three.dart';
import 'components/sliver_page_two.dart';
import 'components/sliver_tabbar.dart';

class SliverPage extends StatefulWidget {
  const SliverPage({Key? key}) : super(key: key);

  @override
  _SliverPageState createState() => _SliverPageState();
}

class _SliverPageState extends State<SliverPage> with TickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;

  final page1Key = new GlobalKey();
  final page2Key = new GlobalKey();
  final page3Key = new GlobalKey();

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _scrollController = ScrollController();
    _scrollController.addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
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
              onTap: _onTapToScroll,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                PageOne(
                  key: page1Key,
                ),
                PageTwo(
                  key: page2Key,
                ),
                PageThree(
                  key: page3Key,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onTapToScroll(int index) async {
    var keys = [page1Key, page2Key, page3Key];
    var previousIndex = _tabController.previousIndex;

    if (index == 0) {
      await _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    } else {
      if (previousIndex < index) {
        for (var i = previousIndex; i <= index; i++) {
          final RenderBox renderBox =
              keys[i].currentContext!.findRenderObject() as RenderBox;
          await _scrollController.position.ensureVisible(
            renderBox,
            duration: const Duration(milliseconds: 100),
            curve: Curves.linear,
          );
        }
      } else {
        for (var i = previousIndex; i >= index; i--) {
          final RenderBox renderBox =
              keys[i].currentContext!.findRenderObject() as RenderBox;
          await _scrollController.position.ensureVisible(
            renderBox,
            // keys[i].currentContext!.findRenderObject(),
            duration: const Duration(milliseconds: 100),
            curve: Curves.linear,
          );
        }
      }
    }
  }
}
