import 'package:dio/dio.dart';
import 'package:fate/bean/Xiaohua.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

class DioTest extends StatefulWidget {
  @override
  _DioTestState createState() => _DioTestState();
}

class _DioTestState extends State<DioTest> {
  int _page = 1;
  String str = '';
  List<User2> list2 = new List<User2>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHttp1();
    setState(() {});
  }

  void getHttp1() async {
    try {
      Response response = await Dio().get("http://api.jisuapi.com/xiaohua/text?pagenum=$_page&pagesize=20&sort=addtime&appkey=f898445e12d9ece2");
      User user = new User((response.data));
      list2.addAll(user.result.list);
      setState(() {

      });
    } catch (e) {
      print(e);
    }
  }

  Widget body () {

    if(list2.length > 0) {
      return  ListView.builder(
        itemCount: list2.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(top: 30),
            child: Text('${list2[index].content}'),
          );
        },
      );
    } else {
      return SpinKitChasingDots(color: Colors.deepOrange,);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("笑话"),
        actions: <Widget>[
          RaisedButton(
            child: Icon(Icons.chevron_right),
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
}
