import 'package:fate/page/BookPage.dart';
import 'package:flutter/material.dart';
class DianShangBook extends StatefulWidget {
  @override
  _DianShangBookState createState() => _DianShangBookState();
}

class _DianShangBookState extends State<DianShangBook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('电商图书数据'),
      ),
      body: GridView.builder(
        itemCount: _data.length,
        padding: EdgeInsets.all(10),
          itemBuilder: (BuildContext context,int index) {
        return InkWell(
          child: Card(
            child: Container(
              alignment: Alignment.center,
              child: Text(_data[index]["catalog"],style: TextStyle(
                fontSize: 40,
              ),),
            ),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context)=>BookPage(
                title: _data[index]["catalog"],
                id: _data[index]["id"],
              ))
            );
          },
        );
      },
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          //单个子Widget的水平最大宽度
          maxCrossAxisExtent: 200,
          //水平单个子Widget之间间距
          mainAxisSpacing: 20.0,
          //垂直单个子Widget之间间距
          crossAxisSpacing: 10.0
      ),
      ),
    );
  }

  List _data  = [
    {
      "id":242,
      "catalog":"中国文学"
    },
    {
      "id":252,
      "catalog":"人物传记"
    },
    {
      "id":244,
      "catalog":"儿童文学"
    },
    {
      "id":248,
      "catalog":"历史"
    },
    {
      "id":257,
      "catalog":"哲学"
    },
    {
      "id":243,
      "catalog":"外国文学"
    },
    {
      "id":247,
      "catalog":"小说"
    },
    {
      "id":251,
      "catalog":"心灵鸡汤"
    },
    {
      "id":253,
      "catalog":"心理学"
    },
    {
      "id":250,
      "catalog":"成功励志"
    },
    {
      "id":249,
      "catalog":"教育"
    },
    {
      "id":245,
      "catalog":"散文"
    },
    {
      "id":256,
      "catalog":"理财"
    },
    {
      "id":254,
      "catalog":"管理"
    },
    {
      "id":246,
      "catalog":"经典名著"
    },
    {
      "id":255,
      "catalog":"经济"
    },
    {
      "id":258,
      "catalog":"计算机"
    }
  ];

}
