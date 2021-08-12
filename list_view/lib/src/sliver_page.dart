import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'pages/sliver_appbar.dart';
import 'pages/sliver_page_one.dart';
import 'pages/sliver_page_three.dart';
import 'pages/sliver_page_two.dart';
import 'pages/sliver_tabbar.dart';

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

  double page1Height = 0;
  double page2Height = 0;
  double page3Height = 0;
  bool isTapToScroll = false;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      _onScroll();
    });

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
            // pinned: true,
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

  void _onScroll() {
    if (isTapToScroll) return;

    if (page1Key.currentContext != null) {
      page1Height = page1Key.currentContext!.size!.height;
    }
    if (page2Key.currentContext != null) {
      page2Height = page2Key.currentContext!.size!.height;
    }
    if (page3Key.currentContext != null) {
      page3Height = page3Key.currentContext!.size!.height;
    }

    if (_scrollController.offset <= page1Height) {
      _tabController.animateTo(0,
          duration: const Duration(milliseconds: 0), curve: Curves.linear);
    } else if (_scrollController.offset > page1Height &&
        _scrollController.offset <= page1Height + page2Height) {
      _tabController.animateTo(1,
          duration: const Duration(milliseconds: 0), curve: Curves.linear);
    } else if (_scrollController.offset > page1Height + page2Height &&
        _scrollController.offset <= page1Height + page2Height + page3Height) {
      _tabController.animateTo(2,
          duration: const Duration(milliseconds: 0), curve: Curves.linear);
    }
  }

  void _onTapToScroll(int index) async {
    var keys = [page1Key, page2Key, page3Key];
    var previousIndex = _tabController.previousIndex;

    isTapToScroll = true;
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
    isTapToScroll = false;
  }
}
