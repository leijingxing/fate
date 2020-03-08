import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fate/Login/login.dart';
import 'package:fate/data/MyColors.dart';
import 'package:fate/tab/Tabs.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Slpash extends StatefulWidget {
  @override
  _SlpashState createState() => _SlpashState();
}

class _SlpashState extends State<Slpash> {

  SharedPreferences sharedPreferences;

  String _names;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _get();

    Timer(Duration(milliseconds: 500), () {
      if(_names == null) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Login()),
                (route) => route == null
        );
      } else {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Tabs()),
                (route) => route == null
        );
      }

    });


  }


  _get() async {
    sharedPreferences = await SharedPreferences.getInstance();
    String names = sharedPreferences.getString("name");
    _names = names;
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
