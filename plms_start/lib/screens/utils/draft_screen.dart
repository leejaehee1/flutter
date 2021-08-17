import 'package:flutter/material.dart';
import 'package:get/get.dart';

// https://www.youtube.com/watch?v=eWhnXGjppHw

class DraftPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _cdx = 0;
  double _cdy = 0;

  double get cdx => this._cdx;
  double get cdy => this._cdy;

  set cdx(double newCdx) => this._cdx = newCdx;
  set cdy(double newCdy) => this._cdy = newCdy;

  double boxWidth = 100.0;
  double boxHeight = 100.0;

  var pixelList = [];

  @override
  void initState() {
    Future.microtask(() {
      _cdx = MediaQuery.of(context).size.width / 2 - (this.boxWidth / 2);
      _cdy = MediaQuery.of(context).size.height / 2 - (this.boxHeight / 2);
    }).then((_) => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Draft Image'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
            print(pixelList);
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              pixelList.add([this.cdx, this.cdy]);
              print("pixelList");
              print(pixelList);
              // Get.to(PageThree(), arguments: pixelList);
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: GestureDetector(
        onTapDown: (TapDownDetails td) {
          setState(() {
            this.cdx = td.globalPosition.dx - (this.boxWidth / 5);
            this.cdy = td.globalPosition.dy - (this.boxHeight * 1.15);
            // this.cdx = td.globalPosition.dx;
            // this.cdy = td.globalPosition.dy;
            print([this.cdx, this.cdy]);
            // print();
          });
        },
        child: Container(
          // width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,
          // color: Colors.black,
          child: SafeArea(
            child: Stack(
              children: <Widget>[
                Image.asset(
                  'assets/punch_draft_sample.jpg',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  fit: BoxFit.fill,
                ),
                Transform.translate(
                  offset: Offset(cdx, cdy),
                  child: Container(
                    // child: Icon(Icons.add_location_sharp, color: Colors.white,),
                    child: TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_location_sharp,
                          color: Colors.black,
                        ),
                        label: Text(
                          'map',
                          style: TextStyle(color: Colors.black),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
