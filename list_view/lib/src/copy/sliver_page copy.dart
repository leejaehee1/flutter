import 'package:flutter/material.dart';
import 'package:list_view/src/pages/sliver_appbar.dart';

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
          // SliverAppBar(
          //   // expandedHeight: 0,
          //   elevation: 0,
          //   pinned: true,
          //   // titleSpacing: 0,
          //   backgroundColor: Colors.red,
          //   title: CatalogTabBar(
          //     tabController: _tabController,
          //     // onTap: ,
          //   ),
          // ),
          // SliverToBoxAdapter(
          //   child: Container(
          //     width: double.infinity,
          //     height: 60,
          //     color: Colors.yellow,
          //     child: Align(
          //       alignment: Alignment.center,
          //       child: Text(
          //         'yellow',
          //         style: TextStyle(
          //           fontSize: 20,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (BuildContext context, int idx) {
              return Container(
                  child: Column(
                children: [
                  _buildA(),
                  _buildB(),
                  _buildC(),
                ],
              ));
            },
            childCount: 4,
          ))
        ],
      ),
    );
  }

  Widget _buildA() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // _header(),
        _texttitle('General Infomation'),
        SizedBox(
          height: 20,
        ),
        _catalog('Catagory'),
        _catalog('System'),
        _catalog('Sub-system'),
        _catalog('Unit'),
        _catalog('Area'),
        Row(
          children: [],
        )
      ],
    );
  }

  Widget _buildB() {
    return Container(
      child: Text('two'),
    );
  }

  Widget _buildC() {
    return Container(
      child: Text('three'),
    );
  }

  Widget _header() {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              Text(
                'Punch Issue',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _texttitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.indigo,
      ),
    );
  }

  Widget _catalog(String title) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(title),
        ),
      ],
    );
  }
}
