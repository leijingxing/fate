import 'package:dio/dio.dart';
import 'package:fate/bean/WeChatbean.dart';
import 'package:fate/page/webView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Drawer.dart';

class WeChatPage extends StatefulWidget {
  @override
  _WeChatPageState createState() => _WeChatPageState();
}

class _WeChatPageState extends State<WeChatPage> {

  ScrollController scrollController = new ScrollController();

  int _page=1;   //页数
  int _ps = 50;  //返回条数
  List<wechatuser> _list = new List<wechatuser>();

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();


  void GetWeChat() async {
    try {
      Response response = await Dio().get(
          "http://v.juhe.cn/weixin/query?pno=$_page&ps=$_ps&dtype=&key=c3108f077641a9fd36cdfbcdee836be9");
      WeiXin weiXin = new WeiXin(response.data);
      _list.clear();
      _list.addAll(weiXin.result.list);
      setState(() {
        scrollController.animateTo(.0, duration: Duration(milliseconds: 200), curve: Curves.ease);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    GetWeChat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        title: Text('微信精选'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.list,
          ),
          onPressed: () {
            this._globalKey.currentState.openDrawer();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.autorenew,color: Colors.white,),
            onPressed: () {
              _page++;
              GetWeChat();
            },
          )
        ],
      ),
      body: body(),
      drawer: Drawer(
        child: DrawerPage(),
      ),
    );
  }

  Widget body() {
    if(_list.length > 1) {
      return Padding(
        padding: EdgeInsets.all(5),
        child: ListView.builder(
          controller: scrollController,
          itemCount: _list.length,
          itemBuilder: (BuildContext context,int index) {
            return GestureDetector(
              child: Card(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text('${_list[index].title}'),
                      subtitle: Text('${_list[index].source}'),
                    ),
                  ],
                ),

              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>WebViewPage(
                        _list[index].url,
                        _list[index].title
                    ))
                );
              },
            );
          },
        ),
      );
    } else {
      return SpinKitChasingDots(
        color: Colors.greenAccent,
      );
    }
  }

}
