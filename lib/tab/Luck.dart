import 'package:fate/list/LuckData.dart';
import 'package:fate/list/color.dart';
import 'package:fate/page/Pray.dart';
import 'package:flutter/material.dart';

class Luck extends StatefulWidget {
  @override
  _LuckState createState() => _LuckState();
}

class _LuckState extends State<Luck> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(10),
          child: GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.all(5),
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
            children: List.generate(luck.length, (index) {
              return InkWell(
                child: Card(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      luck[index]["text"],
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  color: color[index][Color],
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return Pray(
                        title: luck[index]["text"],
                        color: color[index][Color],
                      );
                    })
                  );
                },
              );
            }),
          )),
    );
  }
}
