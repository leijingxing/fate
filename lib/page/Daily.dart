import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fate/bean/Dailybean.dart';
import 'package:flutter/material.dart';

class Daily extends StatefulWidget {
  @override
  _DailyState createState() => _DailyState();
}


class _DailyState extends State<Daily> {


  List _list = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHttp();
  }

  void getHttp() async {
    try {
      Response response = await Dio().get(
          "http://47.102.146.16:3001/api/daily_list"
      );
       _list = new DailyBean.fromJson(response.data.toString()).data1;
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('前端日报'),
      ),
      body: ListView.builder(
        itemCount: _list.length,
        itemBuilder: (BuildContext context,int index) {
          return Card(
            child: ListTile(
              title: Text('${_list[index]}'),
            ),
          );
        },
      ),
    );
  }
}
