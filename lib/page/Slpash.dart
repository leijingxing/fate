import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fate/style/MyColor.dart';
import 'package:flutter/material.dart';

class Slpash extends StatefulWidget {
  @override
  _SlpashState createState() => _SlpashState();
}

class _SlpashState extends State<Slpash> {

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
