import 'package:fate/tab/Tabs.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  SharedPreferences sharedPreferences;
  String name;
  String email;
  String constellation;
  DateTime _date =  DateTime.now();
  TimeOfDay _time =  TimeOfDay.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  _sava() async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("name", name);
    sharedPreferences.setString("email", email);
    sharedPreferences.setString("constellation", constellation);
  }


  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(1900, 1),
        lastDate: DateTime.now());
    if (picked != null && picked != _date)
      print("日期选择 :${_date.toString()}");
    setState(() {
      _date = picked;
    });

    if (picked == null) _date = DateTime.now();

    constellation = getConstellation(picked).toString();
    print("------------"+getConstellation(picked).toString());

  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(context: context, initialTime: _time);
    if (picked != null && picked != _time)
      print("时间选择 :${_time.toString()}");
    setState(() {
      _time = picked;
    });
    if (picked == null) _time =  TimeOfDay.now();
  }

  ///根据日期，返回星座
  static String getConstellation(DateTime birthday) {
    final String capricorn = '摩羯座'; //Capricorn 摩羯座（12月22日～1月20日）
    final String aquarius = '水瓶座'; //Aquarius 水瓶座（1月21日～2月19日）
    final String pisces = '双鱼座'; //Pisces 双鱼座（2月20日～3月20日）
    final String aries = '白羊座'; //3月21日～4月20日
    final String taurus = '金牛座'; //4月21～5月21日
    final String gemini = '双子座'; //5月22日～6月21日
    final String cancer = '巨蟹座'; //Cancer 巨蟹座（6月22日～7月22日）
    final String leo = '狮子座'; //Leo 狮子座（7月23日～8月23日）
    final String virgo = '处女座'; //Virgo 处女座（8月24日～9月23日）
    final String libra = '天秤座'; //Libra 天秤座（9月24日～10月23日）
    final String scorpio = '天蝎座'; //Scorpio 天蝎座（10月24日～11月22日）
    final String sagittarius = '射手座'; //Sagittarius 射手座（11月23日～12月21日）

    int month = birthday.month;
    int day = birthday.day;
    String constellation = '';

    switch (month) {
      case DateTime.january:
        constellation = day < 21 ? capricorn : aquarius;
        break;
      case DateTime.february:
        constellation = day < 20 ? aquarius : pisces;
        break;
      case DateTime.march:
        constellation = day < 21 ? pisces : aries;
        break;
      case DateTime.april:
        constellation = day < 21 ? aries : taurus;
        break;
      case DateTime.may:
        constellation = day < 22 ? taurus : gemini;
        break;
      case DateTime.june:
        constellation = day < 22 ? gemini : cancer;
        break;
      case DateTime.july:
        constellation = day < 23 ? cancer : leo;
        break;
      case DateTime.august:
        constellation = day < 24 ? leo : virgo;
        break;
      case DateTime.september:
        constellation = day < 24 ? virgo : libra;
        break;
      case DateTime.october:
        constellation = day < 24 ? libra : scorpio;
        break;
      case DateTime.november:
        constellation = day < 23 ? scorpio : sagittarius;
        break;
      case DateTime.december:
        constellation = day < 22 ? sagittarius : capricorn;
        break;
    }

    return constellation;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("注册"),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Text("请输入你的姓名"),
                  TextField(
                    onChanged: (names) {
                      name = names;
                    },
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 30,top: 30),
              child: Column(
                children: <Widget>[
                  Text("请输入你的邮箱"),
                  TextField(
                    onChanged: (emails) {
                      email = emails;
                    },
                  ),
                ],
              ),
            ),

            Container(
              child: Column(
                children: <Widget>[
                  Text('出生日期选择'),
                  RaisedButton(
                    child:  Text('出生日期:${_date.toString()}'),
                    onPressed: () {
                      _selectDate(context);
                    },
                  ),
                  Text('出生时间选择'),
                  RaisedButton(
                    child:  Text('出生时间:${_time.toString()}'),
                    onPressed: () {
                      _selectTime(context);
                    },
                  )
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 30),
              child: Column(
                children: <Widget>[
                  Card(
                    elevation: 10,
                    child: Text("${getConstellation(_date).toString()}",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24
                    ),),
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 30),
              height: 60,
              child: RaisedButton(
                  onPressed: () {
                    _sava();
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Tabs()));
                  },
                  color: Colors.brown,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular((30)),
                  ),
                  child: Center(
                    child: Text(
                      '确定',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
