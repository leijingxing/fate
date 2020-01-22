import 'package:fate/style/MyColor.dart';
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

    if (picked == null) _date =  DateTime.now();
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
