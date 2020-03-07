import 'package:dio/dio.dart';
import 'package:fate/bean/Toutiao.dart';
import 'package:fate/page/webView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class TouTiaoNews extends StatefulWidget {
  @override
  _TouTiaoNewsState createState() => _TouTiaoNewsState();
}

class _TouTiaoNewsState extends State<TouTiaoNews> {

  ScrollController scrollController = new ScrollController();

  String _type = 'top';
  List<TouTiaouser> _list = new List<TouTiaouser>();

  void GetNews() async {
    try {
      Response response = await Dio().get(
          "http://v.juhe.cn/toutiao/index?type=$_type&key=59ad2dd0e1049ce800a53945a407d8b5");
      Toutiao _toutiao = new Toutiao(response.data);
      _list.clear();
      _list.addAll(_toutiao.result.data);

      scrollController.animateTo(.0,duration: Duration(milliseconds: 200), curve: Curves.ease);

      setState(() {
      });
    } catch (e) {
      print(e);
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetNews();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('头条'),
        actions: <Widget>[
           IconButton(
             icon: PopupMenuButton(
               child: Icon(
                 Icons.dehaze,
                 size: 20,
               ),
               itemBuilder: (BuildContext context) {
                 List<PopupMenuEntry> list = List<PopupMenuEntry>();
                 list.add(
                   PopupMenuItem(
                     value: 'top',
                     child: Text(
                       "头条",
                       style:
                       TextStyle(fontSize: 16),
                     ),
                   ),
                 );
                 list.add(PopupMenuDivider());
                 list.add(
                   PopupMenuItem(
                       value: 'shehui',
                       child: Text(
                         "社会",
                         style: TextStyle(
                           fontSize: 16,
                         ),
                       )),
                 );
                 list.add(PopupMenuDivider());
                 list.add(
                   PopupMenuItem(
                     value: 'guonei',
                     child: Text(
                       "国内",
                       style:
                       TextStyle(fontSize: 16),
                     ),
                   ),
                 );
                 list.add(PopupMenuDivider());
                 list.add(
                   PopupMenuItem(
                       value: 'guoji',
                       child: Text(
                         "国际",
                         style: TextStyle(
                           fontSize: 16,
                         ),
                       )),
                 );
                 list.add(PopupMenuDivider());
                 list.add(
                   PopupMenuItem(
                     value: 'yule',
                     child: Text(
                       "娱乐",
                       style:
                       TextStyle(fontSize: 16),
                     ),
                   ),
                 );
                 list.add(PopupMenuDivider());
                 list.add(
                   PopupMenuItem(
                       value: 'tiyu',
                       child: Text(
                         "体育",
                         style: TextStyle(
                           fontSize: 16,
                         ),
                       )),
                 );
                 list.add(PopupMenuDivider());
                 list.add(
                   PopupMenuItem(
                     value: 'junshi',
                     child: Text(
                       "军事",
                       style:
                       TextStyle(fontSize: 16),
                     ),
                   ),
                 );
                 list.add(PopupMenuDivider());
                 list.add(
                   PopupMenuItem(
                       value: 'keji',
                       child: Text(
                         "科技",
                         style: TextStyle(
                           fontSize: 18,
                         ),
                       )),
                 );
                 list.add(PopupMenuDivider());
                 list.add(
                   PopupMenuItem(
                     value: 'caijing',
                     child: Text(
                       "财经",
                       style:
                       TextStyle(fontSize: 16),
                     ),
                   ),
                 );
                 list.add(PopupMenuDivider());
                 list.add(
                   PopupMenuItem(
                       value: 'shishang',
                       child: Text(
                         "时尚",
                         style: TextStyle(
                           fontSize: 16,
                         ),
                       )),
                 );

                 return list;
               },
               onSelected: (action) {
                 switch (action) {
                   case "top":
                     _type = 'top';
                     GetNews();
                     break;
                   case "shehui":
                     _type = 'shehui';
                     GetNews();
                     break;
                   case "guonei":
                     _type = 'guonei';
                     GetNews();
                     break;
                   case "guoji":
                      _type = 'guoji';
                      GetNews();
                     break;
                   case "yule":
                     _type = 'yule';
                     GetNews();
                     break;
                   case "tiyu":
                     _type = 'tiyu';
                     GetNews();
                     break;
                   case "junshi":
                     _type = 'junshi';
                     GetNews();
                     break;
                   case "keji":
                     _type = 'keji';
                     GetNews();
                     break;
                   case "caijing":
                     _type = 'caijing';
                     GetNews();
                     break;
                   case "shishang":
                     _type = 'shishang';
                     GetNews();
                     break;
                 }
               },
             ),
             onPressed: () {

             },
           )

        ],
        automaticallyImplyLeading: false,
      ),
      body: body(),
      floatingActionButton: FloatingActionButton(
        child: IconButton(
          icon: Icon(Icons.autorenew),
          onPressed: () {
            GetNews();
          },
        ),
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
                      subtitle: Image.network('${_list[index].thumbnail_pic_s}'),
                    ),
                    ListTile(
                      title: Text("${_list[index].category}"),
                      trailing: Text("${_list[index].author_name}"),
                      subtitle: Text("${_list[index].date}"),
                    )
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
