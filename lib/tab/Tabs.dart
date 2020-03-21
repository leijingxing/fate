import 'package:fate/data/MyColors.dart';
import 'package:fate/tab/Drawer.dart';
import 'package:fate/tab/TouTiaoNews.dart';
import 'package:fate/tab/WeChatPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../page/Luck.dart';
import 'home.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

class Tabs extends StatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  SharedPreferences sharedPreferences;
  int _currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
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
                  icon: Icon(FontAwesomeIcons.americanSignLanguageInterpreting), title: Text("星座配对")),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.newspaper), title: Text("头条")),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.weixin), title: Text("精选")),
            ]),

      ),
    );
  }

  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(
              title: Text('确定退出程序吗?'),
              content: Image.network('http://pics.sc.chinaz.com/Files/pic/faces/4480/07.gif'),
              actions: <Widget>[
                FlatButton(
                  child: Text('暂不'),
                  onPressed: () => Navigator.pop(context, false),
                ),
                FlatButton(
                  child: Text('确定'),
                  onPressed: () => Navigator.pop(context, true),
                ),
              ],
            ));
  }


}
