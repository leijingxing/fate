import 'dart:async';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:fate/bean/Xiaohua.dart';
import 'package:fate/data/MyColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DioTest extends StatefulWidget {
  @override
  _DioTestState createState() => _DioTestState();
}

class _DioTestState extends State<DioTest> {
  ScrollController scrollController = new ScrollController();
  List<xiahua> list2 = new List<xiahua>();

  List<Color> bgcolors = [
    Color(0xFF7Ba6F4),
    Colors.greenAccent,
    Colors.pink,
    Color(0xFFFF7F00),
    Color(0xFFD15FEE),
    Color(0xFFffee93),
    Color(0xFF9Aa2CD),
    Color(0xFFa3a380),
    Color(0xFFfA32aD),

  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHttp1();
    Timer(Duration(milliseconds: 800), (){
      setState(() {
      });
    });
  }

  void getHttp1() async {
    try {
      Response response = await Dio().get(
          "http://v.juhe.cn/joke/randJoke.php?key=6afef119056699a0d7d570db6a9d8246");
      XiaoHua user = new XiaoHua((response.data));
      list2.clear();
      list2.addAll(user.result);
      scrollController.animateTo(.0,duration: Duration(milliseconds: 200), curve: Curves.ease);
      setState(() {

      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("笑话"),
      ),
      body: RefreshIndicator(
        color: MyColor.zhutise1,
        onRefresh: _refreshData,
        child: body(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.autorenew),
        onPressed: () {
            getHttp1();
        },
      ),
    );
  }

  Widget body() {
    if (list2.length != 0) {
      return ListView.builder(
        controller: scrollController,
        itemCount: list2.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: EdgeInsets.only(top: 30,left: 10,right: 10),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Text(
                '${list2[index].content}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            color: bgcolors[Random().nextInt(5)],
          );
        },
      );
    } else {
      return SpinKitChasingDots(
        color: Colors.greenAccent,
      );
    }
  }


  Future<Null> _refreshData() async {
    await Future.delayed(Duration(seconds: 0)).then((e) {
        getHttp1();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController.dispose();
  }


}
