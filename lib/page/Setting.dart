import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {

  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }


  Future<void> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  Widget _infoTile(String title, String subtitle) {
    return Container(
      margin: EdgeInsets.all(10),
      child: ListTile(
        leading: Text(title),
        trailing: Text(subtitle ?? 'Not set'),
      ),
      decoration: BoxDecoration(
        color: Colors.greenAccent[100]
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("版本号"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            _infoTile('App名称', _packageInfo.appName),
            _infoTile('App版本', _packageInfo.version),
          ],
        ),
      ),
    );
  }
}
