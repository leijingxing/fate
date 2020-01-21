import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class Pray extends StatefulWidget {
  String title;
  Color color;
  Pray({this.title,this.color});
  @override
  _PrayState createState() => _PrayState(title: title,color: color);
}

class _PrayState extends State<Pray> {
  String title;
  Color color;
  _PrayState({this.title,this.color});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(20),
        child: Card(
          elevation: 0,
          color: Colors.transparent,
          child: FlipCard(
            direction: FlipDirection.HORIZONTAL,
            speed: 2000,
            onFlipDone: (status) {
              print(status);
            },
            front:  Container(
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(title, style: Theme.of(context).textTheme.headline),
                  Text('点击开始祈福',
                      style: Theme.of(context).textTheme.body1),
                ],
              ),
            ),
            back: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('祈福成功', style: Theme.of(context).textTheme.headline),
                  Text(title,
                      style: Theme.of(context).textTheme.body1),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
