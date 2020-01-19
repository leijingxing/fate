import 'package:flutter/material.dart';

class EveryDayMoney extends StatefulWidget {
  @override
  _EveryDayMoneyState createState() => _EveryDayMoneyState();
}

class _EveryDayMoneyState extends State<EveryDayMoney> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("每日财运"),
      ),
      body: Text("每日财运"),
    );
  }
}
