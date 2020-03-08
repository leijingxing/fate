import 'package:dio/dio.dart';
import 'package:fate/bean/chengyubean.dart';
import 'package:fate/data/MyColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ChengYuPage extends StatefulWidget {
  @override
  _ChengYuPageState createState() => _ChengYuPageState();
}

class _ChengYuPageState extends State<ChengYuPage> {

  String word;

  Chengyu chengyu;
  chengyu1 _list;

  bool str = false;

  void GetChengyu() async {
    try {
      str = true;
      Response response = await Dio().get(
          "http://v.juhe.cn/chengyu/query?word=$word&dtype=&key=4c389e3d7a29a4e94713e357dc0558fd");
      chengyu = new Chengyu(response.data);
      _list = chengyu.result;
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
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('成语词典'),
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                  onChanged: (text) {
                    word = text;
                  },
                decoration: InputDecoration(
                  labelText: "成语",
                ),
                ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              margin: EdgeInsets.only(top: 5,bottom: 20),
              height: 50,
              child: RaisedButton(
                child: Text('搜索',style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),),
                onPressed: () {
                  GetChengyu();
                },
                color: MyColor.zhutise1,
                shape: StadiumBorder(),
              ),
            ),
            Expanded(
              child: body()
            )
          ],
        )
      ),
    );
  }

  Widget body() {
    if(str == false) {
      return Center(
        child: Text('请输入成语'),
      );
    }
    else if(chengyu.error_code == 215702) {
      return Center(
        child: Text('查询不到该成语相关信息'),
      );
    } else if(chengyu.error_code == 10012) {
      return Center(
        child: Text('超过每日可允许请求次数!'),
      );
    } else if(chengyu.reason.endsWith('success')){
        return Card(
          child: ListView(
            children: <Widget>[
              ListTile(
                leading: Text("首字部首"),
                title: Text('${_list.bushou}'),
              ),
              ListTile(
                leading: Text('拼音'),
                title: Text("${_list.pinyin}"),
              ),
              ListTile(
                leading: Text('解释'),
                title: Text("${_list.chengyujs}"),
              ),
              ListTile(
                leading: Text('出处'),
                title: Text("${_list.from_}"),
              ),
              ListTile(
                leading: Text('举例'),
                title: Text("${_list.example}"),
              ),
              ListTile(
                leading: Text('语法'),
                title: Text("${_list.yufa}"),
              ),
              ListTile(
                leading: Text('词语解释'),
                title: Text("${_list.ciyujs}"),
              ),
              ListTile(
                leading: Text('引证解释'),
                title: Text("${_list.yinzhengjs}"),
              ),
              ListTile(
                leading: Text('同义'),
                title: Text("${_list.tongyi.toString()}"),
              ),
              ListTile(
                leading: Text('反义'),
                title: Text("${_list.fanyi.toString()}"),
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
