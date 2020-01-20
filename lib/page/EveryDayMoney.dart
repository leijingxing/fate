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
      body: Container(
        padding: EdgeInsets.all(30),
        alignment: Alignment.center,
        child: Text(
            "今天财运不理想，会因为固执和较真而引发破费，容易因为兄弟朋友而失去一些利益，自身需要多理智。",style: TextStyle(
          fontSize: 20,

        ),),
      ),
    );
  }
}
