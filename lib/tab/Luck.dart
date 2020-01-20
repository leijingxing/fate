import 'package:fate/list/LuckData.dart';
import 'package:flutter/material.dart';

class Luck extends StatefulWidget {
  @override
  _LuckState createState() => _LuckState();
}

class _LuckState extends State<Luck> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
          padding: EdgeInsets.all(10),
          child:
              GridView.count(
                crossAxisCount: 4,
                padding: EdgeInsets.all(5),
                crossAxisSpacing: 10,
                children: List.generate(luck.length, (index) {
                  return GridTile(
                    header: Text(luck[index]["text"]),
                    child: Image.network('http://pics.sc.chinaz.com/files/pic/pic9/201912/zzpic21598.jpg'),
                  );
                }),
              )

        ),
    );
  }
}
