import 'dart:math';

import 'package:fate/list/money.dart';
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Card(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1579605922878&di=da4795e4eae03d7692283f82dd95e3c2&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F8ab12d1a3ed74ed1728a1868594fe4e141734d476d45b-5X9irz_fw658"
                          ),
                        ),
                        title: Text("今日财神方位",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),),
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Text(money[Random().nextInt(14)]["position"],style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 26
                        ),),
                      )
                    ],
                  ),

                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Card(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1579606070682&di=e927d6d841be691939b331e3caad351d&imgtype=0&src=http%3A%2F%2Fpic.51yuansu.com%2Fpic3%2Fcover%2F03%2F09%2F20%2F5b431bd520f31_610.jpg"
                          ),
                        ),
                        title: Text("今日财运建议",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),),
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Text(money[Random().nextInt(14)]["suggest"],style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),),
                      )
                    ],
                  ),

                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 20),
                child: Card(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              "http://pics.sc.chinaz.com/files/pic/pic9/201911/zzpic21499.jpg"
                          ),
                        ),
                        title: Text("幸运颜色",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),),
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Text(money[Random().nextInt(14)]["text"],style: TextStyle(
                            fontSize: 18
                        ),),
                      )
                    ],
                  ),

                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
