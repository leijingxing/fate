import 'dart:math';

import 'package:dio/dio.dart';
import 'package:fate/bean/Xiaohua.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DioTest extends StatefulWidget {
  @override
  _DioTestState createState() => _DioTestState();
}

class _DioTestState extends State<DioTest> {
  int _page = 1;
  String str = '';
  List<User2> list2 = new List<User2>();

  List<Color> bgcolors = [
    Color(0xFF7B26FF),
    Colors.greenAccent,
    Colors.pink,
    Color(0xFFFF7F00),
    Color(0xFFD15FEE),
    Color(0xFFffee93),
    Color(0xFF9A32CD),
    Color(0xFFa3a380),
    Color(0xFFfA32aD),

  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHttp1();
    setState(() {});
  }

  void getHttp1() async {
    try {
      Response response = await Dio().get(
          "http://api.jisuapi.com/xiaohua/text?pagenum=$_page&pagesize=20&sort=addtime&appkey=f898445e12d9ece2");
      User user = new User((response.data));
      list2.addAll(user.result.list);
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("笑话"),
        actions: <Widget>[
          RaisedButton(
            child: Icon(
              Icons.chevron_right,
              color: Colors.red,
            ),
            shape: CircleBorder(),
            onPressed: () {
              _page++;
              list2.clear();
              getHttp1();
            },
          )
        ],
      ),
      body: body(),
    );
  }

  Widget body() {
    if (list2.length > 0) {
      return ListView.builder(
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
}
