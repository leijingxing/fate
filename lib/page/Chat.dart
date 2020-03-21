import 'dart:async';

import 'package:dio/dio.dart';
import 'package:fate/bean/chatbean.dart';
import 'package:fate/data/MyColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  String question;
  Chats _chats;

  chatuser _chatuser;
  List _listtype = new List();     //添加类型
  List _listcontent = new List();    //添加内容
  List<Object> _listObject = new List<Object>();
  List _listtext = new List();       //添加文字
  ScrollController _scrollController = new ScrollController();
  TextEditingController _textEditingController = new TextEditingController();
  FocusNode _contentFocusNode = FocusNode();
  void GetLiaoTian() async {
    try {
      Response response = await Dio().get(
          "https://api.jisuapi.com/iqa/query?appkey=2a7eefb0c0c6ea21&question=$question");
      _chats = new Chats(response.data);
      _chatuser = _chats.result;
      _listtype.add(_chatuser.type);
      _listcontent.add(_chatuser.content);

      if(_chatuser.relquestion == null) {
        _listObject.add("智能聊天机器人为你服务");
      } else {
        _listObject.add(_chatuser.relquestion);
      }

      setState(() {
      });
      Timer(Duration(milliseconds: 100), () {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('智能聊天机器人'),
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextField(
                      controller: _textEditingController,
                      onChanged: (text) {
                        question = text;
                      },
                      focusNode: _contentFocusNode,
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                          hintText: '请输入内容',
                          suffixIcon: IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () {
                             _textEditingController.clear();
                            },
                          )),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      icon: Icon(Icons.near_me,color: MyColor.zhutise,),
                      onPressed: () {
                        GetLiaoTian();
                        _listtext.add(question);
                      },
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: _listtext.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      ListTile(
                        trailing: Container(
                          padding: EdgeInsets.all(5),
                          child: Text('${_listtext[index]}',style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w900)),
                          decoration: BoxDecoration(
                              color: MyColor.zhutise,
                              borderRadius: BorderRadius.circular(5)
                          ),
                        ),
                      ),
                      ListTile(
                        leading: ClipOval(
                          child: Image.network(
                            'http://pics.sc.chinaz.com/files/pic/pic9/201312/apic2605.jpg',
                            width: 30,
                            height: 30,
                          ),
                        ),
                        title: Container(
                          padding: EdgeInsets.all(5),
                          child: Text('${_listcontent[index]}',style: TextStyle(
                              color: MyColor.zhutise, fontWeight: FontWeight.w900)),
                          decoration: BoxDecoration(
                            color: Colors.green[100],
                            borderRadius: BorderRadius.circular(5)
                          ),
                        ),
                        subtitle: Text('${_listObject[index]}'),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
    _textEditingController.dispose();
  }

}
