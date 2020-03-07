import 'package:fate/data/MyColors.dart';
import 'package:fate/page/Slpash.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: MyColor.zhutise,
        primaryColor: MyColor.zhutise1
      ),
      home: Slpash(),
    );
  }
}
