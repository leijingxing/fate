import 'dart:math';

import 'package:fate/list/Image.dart';
import 'package:fate/list/color.dart';
import 'package:fate/list/text.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _year;   //年
  int _mouth;  //月
  int _day;    //日
  String week; //星期

  int _colors = Random().nextInt(12); //不超过12的随机数
  String txt;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _year = DateTime.now().year;
    _mouth = DateTime.now().month;
    _day = DateTime.now().day;
    NumberChange(DateTime.now().weekday);
    txt = text[_colors];
  }

  // ignore: non_constant_identifier_names
  NumberChange(int i) async {
    switch (i) {
      case 1:
        week = "星期一";
        break;
      case 2:
        week = "星期二";
        break;
      case 3:
        week = "星期三";
        break;
      case 4:
        week = "星期四";
        break;
      case 5:
        week = "星期五";
        break;
      case 6:
        week = "星期六";
        break;
      case 7:
        week = "星期日";
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Text(
                      "$_year",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      "$_mouth月",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      "$_day",
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      week,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          image[Random().nextInt(12)],
                        ),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.brown),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        "宜",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      child: Text(
                        "破土　修坟　纳采　祭祀　修造　盖屋　动土  竖柱",
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(5),
                    topLeft: Radius.circular(5),
                  ),
                  color: Colors.green[300],
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        "忌",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      child: Text(
                        "入学　裁衣　立券　求财",
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                  color: Colors.green[300],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Card(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1579449840885&di=de0efd26d32cb5e6aba53ab35cf097e4&imgtype=0&src=http%3A%2F%2Fww2.sinaimg.cn%2Fbmiddle%2Fa4aae570jw1eu0q31i5iej20c60b9wek.jpg",
                          ),
                        ),
                        title: Text("今日运势",style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Text(txt),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Card(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            "http://pics.sc.chinaz.com/files/pic/pic9/201911/zzpic21499.jpg"
                          ),
                        ),
                        title: Text("幸运颜色",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),),
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Text(color[_colors]["text"],style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 26
                        ),),
                      )
                    ],
                  ),
                  color: color[_colors][Color],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Card(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            "http://pics.sc.chinaz.com/files/pic/pic9/201911/zzpic21394.jpg"
                          ),
                        ),
                        title: Text("幸运数字",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),),
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Text(_colors.toString(),style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 26
                        ),),
                      )
                    ],
                  ),
                  color: color[_colors][Color],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
