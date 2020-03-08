import 'package:dio/dio.dart';
import 'package:fate/bean/Book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BookPage extends StatefulWidget {
  String title;
  int id;
  BookPage({this.title,this.id});
  @override
  _BookPageState createState() => _BookPageState(title: title,id: id);
}

class _BookPageState extends State<BookPage> {

  String title;
  int id;
  int pn=0;  //数据起始数
  _BookPageState({this.title,this.id});
  int error_code;  //错误码
  List<Book2> _list = new List<Book2>();

  void GetBookdata() async {
    try {
      print(id);
      Response response = await Dio().get(
          "http://apis.juhe.cn/goodbook/query?catalog_id=$id&pn=$pn&rn=30&dtype=&key=8a2bed43033f7bbfdd7e40c7ca80b84a");
      Book book = new Book(response.data);
      error_code = book.error_code;
      _list.addAll(book.result.data);
      print('---------------------');
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
    GetBookdata();
    print('===========');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$title"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.autorenew,color: Colors.white,),
            onPressed: () {
              GetBookdata();
            },
          )
        ],
      ),
      body: body(),
    );
  }

  Widget body() {
    if(error_code == 205003) {
      return Center(
        child: Text('查询不到结果'),
      );
    } else if(error_code == 10012) {
      return Center(
        child: Text('超过每日可允许请求次数!'),
      );
    } else if(_list.length > 0) {
      return ListView.builder(
        itemCount: _list.length,
        itemBuilder: (BuildContext context,int index) {
          return Card(
            child: Text('${_list[index].title}'),
          );
        },
      );
    } else {
      return  SpinKitChasingDots(
        color: Colors.greenAccent,
      );
    }
  }

}
