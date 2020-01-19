import 'package:flutter/material.dart';

import 'Luck.dart';
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
      body:  IndexedStack(children: <Widget>[
        Home(),
        Luck(),
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
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("首页"),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.category), title: Text("测运势")),
            BottomNavigationBarItem(
                icon: Icon(Icons.book), title: Text("起名改名")),
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
              )
            )
          ],
        ),
      ),
    );
  }
}
