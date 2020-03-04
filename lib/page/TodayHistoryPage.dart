import 'package:fate/bean/ToDayUser.dart';
import 'package:flutter/material.dart';

import 'TodayHistory.dart';

class TodayHistoryPage extends StatefulWidget {
  List<Todayuser> _listtoday;
  TodayHistoryPage(this._listtoday);
  @override
  _TodayHistoryPageState createState() => _TodayHistoryPageState(_listtoday);
}

class _TodayHistoryPageState extends State<TodayHistoryPage> {
  List<Todayuser> _listtoday;
  _TodayHistoryPageState(this._listtoday);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('历史上的今天'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemBuilder: (BuildContext context,int index) {
            return ListTile(
              title: Text("${_listtoday[index].title}",),
              subtitle: Text("${_listtoday[index].date}",),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>TodayHistory(
                        _listtoday[index].e_id,
                        _listtoday[index].title,
                    ))
                );
              },
            );
          },
          itemCount: _listtoday.length,
        ),
      ),
    );
  }
}
