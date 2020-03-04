import 'package:dio/dio.dart';
import 'package:fate/bean/ToDayHistory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class TodayHistory extends StatefulWidget {
  String id;
  String title;
  TodayHistory(this.id,this.title);
  @override
  _TodayHistoryState createState() => _TodayHistoryState(id,title);
}

class _TodayHistoryState extends State<TodayHistory> {
  String id;
  String title;
  _TodayHistoryState(this.id,this.title);

  List<ToDayHistoryuser> _listToDayHistoryuser = new List<ToDayHistoryuser>();
  List<HistoryPic> _listHistoryPic = new List<HistoryPic>();

  void GetToDayHistory() async {
    try {

      Response response = await Dio().get(
          "http://v.juhe.cn/todayOnhistory/queryDetail.php?e_id=$id&key=2ed1ffc7a5edcaa5598a7aeb3e648d8e");
      ToDayHistory todayHistory = new ToDayHistory(response.data);
      _listToDayHistoryuser.addAll(todayHistory.result);
      _listHistoryPic.addAll(_listToDayHistoryuser[0].picUrl);
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
    GetToDayHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$title'),
      ),
      body: body(),
    );
  }

  Widget body() {
    if(_listHistoryPic.length > 0) {

      return SingleChildScrollView(
        child: Card(
          child: Column(
            children: <Widget>[
              ListTile(
                subtitle: Text('${_listToDayHistoryuser[0].content}'),
              ),
              Container(
                height: MediaQuery.of(context).size.width * _listHistoryPic.length * 1.4,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _listHistoryPic.length,
                    itemBuilder: (BuildContext context,int index) {
                      return Stack(
                        children: <Widget>[
                          Image.network('${_listHistoryPic[index].url}',
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,),
                          Text("${_listHistoryPic[index].pic_title}",style: TextStyle(
                            color: Colors.white
                          ),)
                        ],
                      );
                    }),
              ),

            ],
          ),
        ),
      );

    } else {
      return SpinKitChasingDots(
        color: Colors.greenAccent,
      );
    }
  }
}
