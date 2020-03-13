import 'package:dio/dio.dart';
import 'package:fate/bean/XingZuoPeiDui.dart';
import 'package:fate/data/MyColors.dart';
import 'package:fate/tab/Drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Luck extends StatefulWidget {
  @override
  _LuckState createState() => _LuckState();
}

class _LuckState extends State<Luck> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  String men = '';
  String women = '';
  XZPD _xzpd;
  xingzuopeidui _xinzuo;
  bool str = false;

  void GetXingzuo() async {
    try {
      str = true;
      Response response = await Dio().get(
          "http://apis.juhe.cn/xzpd/query?men=$men&women=$women&key=bad4ef7b92439a246a41069e42746346");
      print(response.data);
      _xzpd = XZPD(response.data);
      _xinzuo = _xzpd.result;
      setState(() {

      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        title: Text('星座配对'),
        leading: IconButton(
          icon: Icon(
            Icons.list,
          ),
          onPressed: () {
            this._globalKey.currentState.openDrawer();
          },
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Card(
              child: ListTile(
                leading: Text('男方星座'),
                title: Text('$men',style: TextStyle(
                    color: Colors.blue
                ),),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SimpleDialog(
                          title: Text("选择星座"),
                          children: <Widget>[
                            SimpleDialogOption(
                              child: Text('摩羯'),
                              onPressed: () {
                                men = '摩羯';
                                Navigator.of(context).pop();
                                setState(() {

                                });
                              },
                            ),
                            SimpleDialogOption(
                              child: Text('水瓶'),
                              onPressed: () {
                                men = '水瓶';
                                Navigator.of(context).pop();
                                setState(() {

                                });
                              },
                            ),
                            SimpleDialogOption(
                              child: Text('双鱼'),
                              onPressed: () {
                                men = '双鱼';
                                Navigator.of(context).pop();
                                setState(() {

                                });
                              },
                            ),
                            SimpleDialogOption(
                              child: Text('白羊'),
                              onPressed: () {
                                men = '白羊';
                                Navigator.of(context).pop();
                                setState(() {

                                });
                              },
                            ),
                            SimpleDialogOption(
                              child: Text('金牛'),
                              onPressed: () {
                                men = '金牛';
                                Navigator.of(context).pop();
                                setState(() {

                                });
                              },
                            ),
                            SimpleDialogOption(
                              child: Text('摩羯'),
                              onPressed: () {
                                men = '摩羯';
                                Navigator.of(context).pop();
                                setState(() {

                                });
                              },
                            ),
                            SimpleDialogOption(
                              child: Text('双子'),
                              onPressed: () {
                                men = '双子';
                                Navigator.of(context).pop();
                                setState(() {

                                });
                              },
                            ),
                            SimpleDialogOption(
                              child: Text('巨蟹'),
                              onPressed: () {
                                men = '巨蟹';
                                Navigator.of(context).pop();
                                setState(() {

                                });
                              },
                            ),
                            SimpleDialogOption(
                              child: Text('狮子'),
                              onPressed: () {
                                men = '狮子';
                                Navigator.of(context).pop();
                                setState(() {

                                });
                              },
                            ),
                            SimpleDialogOption(
                              child: Text('处女'),
                              onPressed: () {
                                men = '处女';
                                Navigator.of(context).pop();
                                setState(() {

                                });
                              },
                            ),
                            SimpleDialogOption(
                              child: Text('天秤'),
                              onPressed: () {
                                men = '天秤';
                                Navigator.of(context).pop();
                                setState(() {

                                });
                              },
                            ),
                            SimpleDialogOption(
                              child: Text('天蝎'),
                              onPressed: () {
                                men = '天蝎';
                                Navigator.of(context).pop();
                                setState(() {

                                });
                              },
                            ),
                            SimpleDialogOption(
                              child: Text('射手'),
                              onPressed: () {
                                men = '射手';
                                Navigator.of(context).pop();
                                setState(() {

                                });
                              },
                            )
                          ],
                        );
                      });
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Text('女方星座'),
                title: Text('$women',style: TextStyle(
                    color: Colors.red
                ),),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SimpleDialog(
                          title: Text("选择星座"),
                          children: <Widget>[
                            SimpleDialogOption(
                              child: Text('摩羯'),
                              onPressed: () {
                                women = '摩羯';
                                Navigator.of(context).pop();
                                setState(() {

                                });
                              },
                            ),
                            SimpleDialogOption(
                              child: Text('水瓶'),
                              onPressed: () {
                                women = '水瓶';
                                Navigator.of(context).pop();
                                setState(() {

                                });
                              },
                            ),
                            SimpleDialogOption(
                              child: Text('双鱼'),
                              onPressed: () {
                                women = '双鱼';
                                Navigator.of(context).pop();
                                setState(() {

                                });
                              },
                            ),
                            SimpleDialogOption(
                              child: Text('白羊'),
                              onPressed: () {
                                women = '白羊';
                                Navigator.of(context).pop();
                                setState(() {

                                });
                              },
                            ),
                            SimpleDialogOption(
                              child: Text('金牛'),
                              onPressed: () {
                                women = '金牛';
                                Navigator.of(context).pop();
                                setState(() {

                                });
                              },
                            ),
                            SimpleDialogOption(
                              child: Text('摩羯'),
                              onPressed: () {
                                women = '摩羯';
                                Navigator.of(context).pop();
                                setState(() {

                                });
                              },
                            ),
                            SimpleDialogOption(
                              child: Text('双子'),
                              onPressed: () {
                                women = '双子';
                                Navigator.of(context).pop();
                                setState(() {

                                });
                              },
                            ),
                            SimpleDialogOption(
                              child: Text('巨蟹'),
                              onPressed: () {
                                women = '巨蟹';
                                Navigator.of(context).pop();
                                setState(() {

                                });
                              },
                            ),
                            SimpleDialogOption(
                              child: Text('狮子'),
                              onPressed: () {
                                women = '狮子';
                                Navigator.of(context).pop();
                                setState(() {

                                });
                              },
                            ),
                            SimpleDialogOption(
                              child: Text('处女'),
                              onPressed: () {
                                women = '处女';
                                Navigator.of(context).pop();
                                setState(() {

                                });
                              },
                            ),
                            SimpleDialogOption(
                              child: Text('天秤'),
                              onPressed: () {
                                women = '天秤';
                                Navigator.of(context).pop();
                                setState(() {

                                });
                              },
                            ),
                            SimpleDialogOption(
                              child: Text('天蝎'),
                              onPressed: () {
                                women = '天蝎';
                                Navigator.of(context).pop();
                                setState(() {

                                });
                              },
                            ),
                            SimpleDialogOption(
                              child: Text('射手'),
                              onPressed: () {
                                women = '射手';
                                Navigator.of(context).pop();
                                setState(() {

                                });
                              },
                            )
                          ],
                        );
                      });
                },
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: RaisedButton(
                child: Text('点击配对',style: TextStyle(
                  color: Colors.white,
                ),),
                shape: StadiumBorder(),
                color: MyColor.zhutise1,
                onPressed: () {
                    GetXingzuo();
                },
              ),
            ),
            Expanded(
              child: body(),
            )
          ],
        ),
      ),
      drawer: Drawer(
        child: DrawerPage(),
      ),
    );
  }


  Widget body() {
    if(str == false) {
      return Center(
        child: Text('请输入星座'),
      );
    }
    else if(_xzpd.error_code == 253901) {
      return Center(
        child: Text('错误的星座名'),
      );
    } else if(_xzpd.error_code == 10012) {
      return Center(
        child: Text('超过每日可允许请求次数!'),
      );
    } else if(_xzpd.reason.endsWith('success')){
      return Card(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Text("男方星座"),
              title: Text('${_xinzuo.men}'),
            ),
            ListTile(
              leading: Text('女方星座'),
              title: Text("${_xinzuo.women}"),
            ),
            ListTile(
              leading: Text('指数'),
              title: Text("${_xinzuo.zhishu}"),
            ),
            ListTile(
              leading: Text('比重'),
              title: Text("${_xinzuo.bizhong}"),
            ),
            ListTile(
              leading: Text('概率'),
              title: Text("${_xinzuo.tcdj} %"),
            ),
            ListTile(
              leading: Text('结果'),
              title: Text("${_xinzuo.jieguo}"),
            ),
            ListTile(
              leading: Text('恋爱'),
              title: Text("${_xinzuo.lianai}"),
            ),
            ListTile(
              leading: Text('注意'),
              title: Text("${_xinzuo.zhuyi}"),
            ),
          ],
        ),
      );
    }else {
      return  SpinKitChasingDots(
        color: Colors.greenAccent,
      );
    }
  }

}
