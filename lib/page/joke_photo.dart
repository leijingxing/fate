import 'package:dio/dio.dart';
import 'package:fate/bean/Duanzi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class jokephoto extends StatefulWidget {
  @override
  _jokephotoState createState() => _jokephotoState();
}

class _jokephotoState extends State<jokephoto> {

  int _page = 1;

  List<duanzi1> _list = new List<duanzi1>();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHttp();
  }

  void getHttp() async {
    try {
      Response response = await Dio().get(
          "http://47.102.146.16:3001/api/joke_photo/$_page"
      );
      Duanzi duanzi = new Duanzi(response.data);
      _list.addAll(duanzi.data);
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("搞笑图片"),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.all(5),
            child: RaisedButton(
              shape: CircleBorder(),
              child: Icon(Icons.chevron_right,size: 30,),
              color: Colors.greenAccent,
              onPressed: () {
                _page++;
                _list.clear();
                getHttp();
              },
            ),
          )
        ],
      ),
      body: body(),
    );
  }

  Widget body () {
    if (_list.length > 0) {
      return ListView.builder(
        itemCount: _list.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: EdgeInsets.only(top: 30,left: 10,right: 10),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Image.network('http://www.xiaoliaoba.cn${_list[index].img}'),
                  ),
                  Text(
                    '${_list[index].title}',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              )
            ),
            color: Colors.white,
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
