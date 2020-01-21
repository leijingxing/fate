import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fate/Login/login.dart';
import 'package:fate/style/MyColor.dart';
import 'package:fate/tab/Tabs.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Slpash extends StatefulWidget {
  @override
  _SlpashState createState() => _SlpashState();
}

class _SlpashState extends State<Slpash> {

  SharedPreferences sharedPreferences;
  String _name;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _GetUserInfo();

    Timer(Duration(milliseconds: 200), () {
      if(_name != "") {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => Tabs())
        );
      } else {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => Login())
        );
      }
    });
  }


  Future<String> _GetUserInfo() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      _name = sharedPreferences.get("name");
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
        TypewriterAnimatedTextKit(
            onTap: () {

            },
            text: [
              'fate'
            ],
            textStyle: TextStyle(
                fontSize: 40.0,
                color: MyColor.zhutise,
                fontFamily: "Schyler_bold"
            ),
            speed: Duration(milliseconds: 1000),
            textAlign: TextAlign.start,
            alignment: AlignmentDirectional.topStart // or Alignment.topLeft
        ),
      ),
    );

  }

}
