
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _year;
  int _mouth;
  int _day;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _year = DateTime.now().year;
    _mouth = DateTime.now().month;
    _day = DateTime.now().day;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 20,bottom: 20),
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Text("$_year",style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),),
                    Text("$_mouth月",style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),),
                    Text("$_day",style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),),
                  ],
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      "http://pics.sc.chinaz.com/files/pic/pic9/201612/fpic9874.jpg",
                    ),
                    fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.circular(20)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
