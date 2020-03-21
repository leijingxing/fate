import 'dart:math';

import 'package:dio/dio.dart';
import 'package:fate/bean/HuangLi.dart';
import 'package:fate/bean/ToDayUser.dart';
import 'package:fate/data/Image.dart';
import 'package:fate/data/MyColors.dart';
import 'package:fate/data/color.dart';
import 'package:fate/data/text.dart';
import 'package:fate/page/Chat.dart';
import 'package:fate/page/TodayHistory.dart';
import 'package:fate/page/TodayHistoryPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Drawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _year; //年
  int _mouth; //月
  int _day; //日
  String week; //星期

  int _colors = Random().nextInt(12); //不超过12的随机数
  String txt;
  HuangLi huangLi;

  List<Todayuser> _listtoday = new List<Todayuser>();
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  void GetHuangLi() async {
    try {
      Response response = await Dio().get(
          "http://v.juhe.cn/laohuangli/d?date=$_year-$_mouth-$_day&key=357f2ba4a5847632af01a23ccefb4af6");
      huangLi = new HuangLi(response.data);
      setState(() {

      });
    } catch (e) {
      print(e);
    }
  }

  void GetToDay() async {
    try {
      Response response = await Dio().post(
          "http://v.juhe.cn/todayOnhistory/queryEvent.php?date=$_mouth/$_day&key=2ed1ffc7a5edcaa5598a7aeb3e648d8e");
      ToDay toDay = new ToDay(response.data);
      _listtoday.addAll(toDay.result);

      setState(() {

      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _year = DateTime.now().year;
    _mouth = DateTime.now().month;
    _day = DateTime.now().day;
    GetToDay();
    GetHuangLi();
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
      key: _globalKey,
      appBar: AppBar(
        title: Text(
          "home",
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.list,
          ),
          onPressed: () {
            this._globalKey.currentState.openDrawer();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset('svg/liaotian.svg',color: Colors.white,),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=>Chat())
              );
            },
          )
        ],
      ),
      body: body(),
      drawer: Drawer(
        child: DrawerPage(),
      ),
    );
  }


  Widget body() {
    if(_listtoday.length > 0) {
      return SingleChildScrollView(
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
                      "$_year年 $_mouth月",
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
                    Text(
                      "${huangLi.result.yinli}",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          image[Random().nextInt(12)],
                        ),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10),
                    color: MyColor.zhutise1),
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
                    Expanded(
                      child: Container(
                        child: Text(
                          "${huangLi.result.yi}",
                        ),
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
                    Expanded(
                      child: Container(
                        child: Text(
                          "${huangLi.result.ji}",
                        ),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                  color: Colors.amber[200],
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
                              "http://pics.sc.chinaz.com/files/pic/pic9/201903/zzpic17279.jpg"),
                        ),
                        title: Text(
                          "彭祖百忌",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          '${huangLi.result.baiji}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: color[_colors][Color],
                              fontSize: 20),
                        ),
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
                              "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=4294289034,418681099&fm=26&gp=0.jpg"),
                        ),
                        title: Text(
                          "五行",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          '${huangLi.result.wuxing}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: color[_colors][Color],
                              fontSize: 20),
                        ),
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
                              "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=38163796,2230922536&fm=26&gp=0.jpg"),
                        ),
                        title: Text(
                          "冲煞",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          '${huangLi.result.chongsha}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: color[_colors][Color],
                              fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Todayhistory()

            ],
          ),
        ),
      );
    } else {
      return SpinKitChasingDots(
        color: Colors.greenAccent,
      );
    }
  }

  Widget Todayhistory() {
    if(_listtoday.length > 1) {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Card(
          child: Column(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    "http://pics.sc.chinaz.com/files/pic/pic9/202001/zzpic22526.jpg",
                  ),
                ),
                title: Text(
                  "历史上的今天",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                trailing: Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=>TodayHistoryPage(
                          _listtoday
                      ))
                  );
                },
              ),
              Container(
                child: ListTile(
                  title: Text("${_listtoday[0].title}",),
                  subtitle: Text("${_listtoday[0].date}",),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>TodayHistory(
                            _listtoday[0].e_id,
                            _listtoday[0].title
                        ))
                    );
                  },
                ),
              ),
              Container(
                child: ListTile(
                  title: Text("${_listtoday[1].title}",),
                  subtitle: Text("${_listtoday[1].date}",),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>TodayHistory(
                            _listtoday[1].e_id,
                            _listtoday[1].title
                        ))
                    );
                  },
                ),
              ),
              Container(
                child: ListTile(
                  title: Text("更多",),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>TodayHistoryPage(
                            _listtoday,
                        ))
                    );
                  },
                ),
              )
            ],
          ),
        ),
      );
    } else {
      return SpinKitChasingDots(
        color: Colors.greenAccent,
      );
    }
  }

}
