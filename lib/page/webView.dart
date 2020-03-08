import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WebViewPage extends StatefulWidget {
  String weburl;
  String title;
  WebViewPage(this.weburl,this.title);
  @override
  _WebViewPageState createState() => _WebViewPageState(weburl,title);
}

class _WebViewPageState extends State<WebViewPage> {
  String weburl;
  String title;
  _WebViewPageState(this.weburl,this.title);
  @override
  Widget build(BuildContext context) {
    return  WebviewScaffold(
          url: "$weburl",
          clearCache: true,

          appBar: new AppBar(
            title: new Text("$title"),
            leading: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.share),
                onPressed: () {
                  Share.text(title, weburl, 'text/plain');
                },
              )
            ],
          ),
        );

  }
}
