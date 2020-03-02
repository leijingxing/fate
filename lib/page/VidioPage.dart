import 'package:dio/dio.dart';
import 'package:fate/bean/VidioBean.dart';
import 'package:fate/page/VidioPlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Vidio extends StatefulWidget {
  @override
  _VidioState createState() => _VidioState();
}

class _VidioState extends State<Vidio> {

  int _page = 0;
  int _type = 0;

  List<Vidio1> _list = new List<Vidio1>();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHttp();
  }

  void getHttp() async {
    try {
      Response response = await Dio().get(
          "http://47.102.146.16:3001/api/video_list/$_type/$_page"
      );
      VidioList vidioList = new VidioList(response.data);
      _list.addAll(vidioList.data);
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('视频'),
      ),
      body: body(),
    );
  }

  Widget body () {
    if (_list.length > 0) {
      return ListView.builder(
        itemCount: _list.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
              margin: EdgeInsets.only(top: 30, left: 10, right: 10),
              child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Image.network('${_list[index].cover}'),
                      ),
                      ListTile(
                        leading: Container(
                          margin: EdgeInsets.only(top: 5),
                          child: ClipOval(
                            child: Image.network('${_list[index].topicImg}'),
                          ),
                        ),
                        title: Text(
                          '${_list[index].title}',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text('--${_list[index].topicName}'),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=>VidioPlay(
                              title: _list[index].title,
                              time: _list[index].ptime,
                              cover: _list[index].cover,
                               mp4url: _list[index].mp4_url,
                              topicimg: _list[index].topicImg,
                              topicname: _list[index].topicName,
                            ))
                          );
                        },

                      ),
                    ],
                  )
              ),
              color: Colors.white,
            );
        },
      );
    } else {
      return SpinKitChasingDots(
        color: Colors.greenAccent,
      );
    }
  }

}
