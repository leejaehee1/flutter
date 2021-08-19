import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plms_start/pages/utils/button_issue.dart';
import 'package:plms_start/pages/utils/header_issue.dart';

import 'List_file.dart';

// import 'screen_punch.dart';

class ScreenList extends StatefulWidget {
  const ScreenList({Key? key}) : super(key: key);

  @override
  _ScreenListState createState() => _ScreenListState();
}

class _ScreenListState extends State<ScreenList>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _currentIndex = 0;

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int idx = _currentIndex;
    return Scaffold(
        appBar: AppBar(
          title: Text('Title'),
        ),
        body: DefaultTabController(
          // initialIndex: 0,
          length: 5,
          child: Column(
            children: [
              Container(
                color: Color(0xFFE6E6E6),
                child: Container(
                  // width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(10),
                  child: TabBar(
                    onTap: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 1,
                    isScrollable: true,
                    labelColor:
                        _currentIndex == idx ? Colors.white : Colors.black,
                    tabs: [
                      Container(
                        padding: EdgeInsets.all(2),
                        width: MediaQuery.of(context).size.width * 1 / 5,
                        // height: 100,
                        color: _currentIndex == 0 ? Colors.grey : Colors.white,
                        child: Tab(child: _colorChange('All', 0)),
                      ),
                      Container(
                        padding: EdgeInsets.all(2),
                        width: MediaQuery.of(context).size.width * 1 / 5,
                        color: _currentIndex == 1
                            ? Color(0xff7B3F40)
                            : Colors.white,
                        child: Tab(child: _colorChange('Draft', 1)),
                      ),
                      Container(
                        padding: EdgeInsets.all(2),
                        width: MediaQuery.of(context).size.width * 1 / 5,
                        color: _currentIndex == 2
                            ? Color(0xffB09078)
                            : Colors.white,
                        child: Tab(child: _colorChange('Open', 2)),
                      ),
                      Container(
                        padding: EdgeInsets.all(2),
                        width: MediaQuery.of(context).size.width * 1 / 5,
                        color: _currentIndex == 3
                            ? Color(0xff95809D)
                            : Colors.white,
                        child: Tab(child: _colorChange('Req for Close', 3)),
                      ),
                      Container(
                        padding: EdgeInsets.all(2),
                        width: MediaQuery.of(context).size.width * 1 / 5,
                        color: _currentIndex == 4
                            ? Color(0xff637990)
                            : Colors.white,
                        child: Tab(child: _colorChange('Close', 4)),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    ListFile(),
                    ListFile(),
                    ListFile(),
                    ListFile(),
                    ListFile(),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: IssueButton(
            name: '/punchList',
            buttonname1: 'Add Punch Issue',
            buttonname2: 'Upload Photos')
        // TabBar(
        //   controller: _controller,
        //   tabs: [
        //     Tab(
        //       child: Text("data"),
        //     ),
        //     Tab(
        //       child: Text("data"),
        //     ),
        //   ],
        // ),
        );
  }

  Widget _colorChange(String name, int idx) {
    return Text(
      name,
      style: TextStyle(
        color: _currentIndex == idx ? Colors.white : Colors.black,
      ),
    );
  }
}
