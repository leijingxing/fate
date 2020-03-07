import 'package:fate/data/MyColors.dart';
import 'package:fate/tab/Drawer.dart';
import 'package:fate/tab/TouTiaoNews.dart';
import 'package:fate/tab/WeChatPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../page/Luck.dart';
import 'home.dart';

class Tabs extends StatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  SharedPreferences sharedPreferences;
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: IndexedStack(
        children: <Widget>[
          Home(),
          Luck(),
          TouTiaoNews(),
          WeChatPage(),
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
          fixedColor: MyColor.zhutise1,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("首页"),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.category), title: Text("祈福")),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.newspaper), title: Text("头条")),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.weixin), title: Text("精选")),
          ]),
      drawer: Drawer(
        child: DrawerPage(),
      ),
    );
  }
}
