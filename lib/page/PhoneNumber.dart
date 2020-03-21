import 'package:dio/dio.dart';
import 'package:fate/bean/PhoneNumberbean.dart';
import 'package:fate/data/MyColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PhoneNumber extends StatefulWidget {
  @override
  _PhoneNumberState createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {

  var _phonenumber = null;

  phoneuser _phone;

  void GetPhone() async {
    try {
      Response response = await Dio().get(
          "http://apis.juhe.cn/mobile/get?phone=${_phonenumber.toString()}&dtype=&key=b0b0bc3fd0e29ae18a7836bba1d07462");
      Phone phone = new Phone(response.data);
      _phone = phone.result;
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
        title: Text('手机号码归属地查询'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.phone,
              scrollPadding: EdgeInsets.all(1),
              onChanged: (index) {
                _phonenumber = int.parse(index);
                print(_phonenumber);
              },
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: RaisedButton(
                child: Text("确定",style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                )),
                color: MyColor.zhutise1,
                shape: StadiumBorder(),
                onPressed: () {
                  if(_phonenumber==null) {
                    Fluttertoast.showToast(msg: "请输入手机号码");
                  }
                  GetPhone();
                },
              ),
            ),
            card()
          ],
        ),
      ),
    );
  }

  Widget card() {
    if(_phone == null) {
      return Text('');
    } else {
      return Card(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Text("省份"),
              trailing: Text("${_phone.province}"),
            ),
            ListTile(
              leading: Text("城市"),
              trailing: Text("${_phone.city}"),
            ),
            ListTile(
              leading: Text("区号"),
              trailing: Text("${_phone.areacode}"),
            ),
            ListTile(
              leading: Text("运营商"),
              trailing: Text("${_phone.company}"),
            )
          ],
        ),
      );
    }
  }

}
