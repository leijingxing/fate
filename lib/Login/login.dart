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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  _sava () async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("name", name);
    sharedPreferences.setString("email", email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("注册"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: 30),
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
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 30),
              height: 60,
              child: RaisedButton(
                  onPressed: () {
                    print("----------"+name);
                    print("----------"+email);
                    _sava();
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=>Tabs())
                    );
                  },
                  color: Colors.brown,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular((30)),
                  ),
                  child: Center(
                    child: Text(
                      '确定',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  )),
            ),

          ],
        ),
      ),
    );
  }
}
