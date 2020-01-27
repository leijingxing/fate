import 'dart:math';

import 'package:fate/data/Image.dart';
import 'package:fate/page/EveryDayMoney.dart';
import 'package:fate/page/Setting.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Luck.dart';
import 'Marriage.dart';
import 'Named.dart';
import 'home.dart';

class Tabs extends StatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  SharedPreferences sharedPreferences;
  int _currentIndex = 0;
  String _name;
  String _email;
  String _constellation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _GetUserInfo();
  }

  Future<String> _GetUserInfo() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      _name = sharedPreferences.get("name");
      _email = sharedPreferences.getString("email");
      _constellation  = sharedPreferences.getString("constellation");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("fate"),
      ),
      body: IndexedStack(
        children: <Widget>[
          Home(),
          Luck(),
          Marriage(),
          Named(),
        ],
        index: _currentIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: this._currentIndex,
          onTap: (int index) {
            setState(() {
              this._currentIndex = index;
            });
          },
          fixedColor: Colors.brown,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("首页"),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.category), title: Text("祈福")),
            BottomNavigationBarItem(
                icon: Icon(Icons.pregnant_woman), title: Text("姻缘")),
            BottomNavigationBarItem(
                icon: Icon(Icons.border_color), title: Text("起名")),
          ]),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("$_name"),
              accountEmail: Text("$_email"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "http://pic2.sc.chinaz.com/Files/pic/pic9/201912/zzpic22199.jpg"
                ),
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          image[Random().nextInt(12)]
                      ),
                    fit: BoxFit.cover
                  )),
              onDetailsPressed: () {

              },
              otherAccountsPictures: <Widget>[
                Text("$_constellation",style: TextStyle(
                  color: Colors.white
                ),)
              ],
            ),
            ListTile(
              leading: Icon(
                Icons.monetization_on,
                color: Colors.amber,
              ),
              title: Text("每日财运"),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EveryDayMoney()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.star,
                color: Colors.pink,
              ),
              title: Text("每日星座"),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.insert_drive_file,
                color: Colors.brown,
              ),
              title: Text("中国黄历"),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.all_out,
                color: Colors.deepPurple,
              ),
              title: Text("祈福广场"),
              onTap: () {

              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.deepOrange,
              ),
              title: Text("设置"),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Setting()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.text_fields,
                color: Colors.red,
              ),
              title: Text("协议及声明"),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Setting()));
              },
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
