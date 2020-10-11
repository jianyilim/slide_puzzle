import 'dart:async';
import 'dart:io' show Platform;
import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

Future main() async {
  runApp(new MyWebApp(''));
}

class MyWebApp extends StatefulWidget {
  String path1;
  MyWebApp(this.path1);
  @override
  _MyAppState createState() => new _MyAppState(path1);
}

class _MyAppState extends State<MyWebApp> {
  String path1;
  _MyAppState(this.path1);
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: InAppWebViewPage(path1));
  }
}

class Platform {}

class InAppWebViewPage extends StatefulWidget {
  String path1;
  InAppWebViewPage(this.path1);
  @override
  _InAppWebViewPageState createState() => new _InAppWebViewPageState(path1);
}

class _InAppWebViewPageState extends State<InAppWebViewPage> {
  String path1;
  _InAppWebViewPageState(this.path1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: WebView(
        initialUrl: path1,
        javascriptMode: JavascriptMode.unrestricted,
        gestureNavigationEnabled: true,
      ),
    ));
  }
}
