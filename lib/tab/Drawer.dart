import 'dart:math';

import 'package:fate/data/Image.dart';
import 'package:fate/data/MyColors.dart';
import 'package:fate/page/ChengYuPage.dart';
import 'package:fate/page/EveryDayMoney.dart';
import 'package:fate/page/PhoneNumber.dart';
import 'package:fate/page/Setting.dart';
import 'package:fate/page/XiaoHua.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../evenbus.dart';

class DrawerPage extends StatefulWidget {
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {

  var bus = new EventBus();

  SharedPreferences sharedPreferences;
  String _name;
  String _email;
  String _constellation;
  String _icon;
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
      _icon = sharedPreferences.getString('icon');
    });
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("$_name"),
            accountEmail: Text("$_email"),
            currentAccountPicture: ClipOval(
              child: Image.network('$_icon',width: 80,height: 80,fit: BoxFit.cover,),
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
              ),),

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
              Icons.phone_iphone,
              color: Colors.deepPurple,
            ),
            title: Text("手机号码归属地"),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => PhoneNumber()));
            },
          ),

          Divider(),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.smile,
              color: Colors.amberAccent,
            ),
            title: Text("笑话"),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => DioTest()));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.book,
              color: Colors.pink,
            ),
            title: Text("成语词典"),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ChengYuPage()));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.color_lens,
              color: Colors.green,
            ),
            title: Text("主题"),
            onTap: () {

              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return SimpleDialog(
                      title: Text("选择主题"),
                      children: <Widget>[
                        SimpleDialogOption(
                          child: Text('红',style:  TextStyle(
                            color: Colors.red
                          ),),
                          onPressed: () {
                            MyColor.zhutise = Colors.red;
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  });
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
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              color: Colors.amberAccent,
            ),
            title: Text("推出登陆"),
            onTap: () {
              sharedPreferences.clear();
              Navigator.of(context).pop();
            },
          ),

        ],
      ),
    );
  }
}
