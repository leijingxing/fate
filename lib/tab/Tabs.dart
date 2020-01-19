import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Luck.dart';
import 'Marriage.dart';
import 'Named.dart';
import 'home.dart';

class Tabs extends StatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("命运检测"),
      ),
      body:  IndexedStack(children: <Widget>[
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
                icon: Icon(Icons.category), title: Text("测运势")),
            BottomNavigationBarItem(
                icon: Icon(Icons.pregnant_woman), title: Text("测姻缘")),
            BottomNavigationBarItem(
                icon: Icon(Icons.border_color), title: Text("起名改名")),
          ]
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("小可爱"),
              accountEmail: Text("10086@qq.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                  "http://pic2.sc.chinaz.com/Files/pic/pic9/201912/zzpic22199.jpg"
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.monetization_on,color: Colors.amber,),
              title: Text("每日财运"),
              onTap: () {

              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.star,color: Colors.pink,),
              title: Text("每日星座"),
              onTap: () {

              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.insert_drive_file,color: Colors.brown,),
              title: Text("中国黄历"),
              onTap: () {

              },
            ),
            Divider(),
             ListTile(
              leading: Icon(Icons.format_paint,color: Color(0xFFeaa033),),
              title: Text("大师签名"),
              onTap: () {

              },
            ),
            Divider(),

          ],
        ),
      ),
    );
  }
}
