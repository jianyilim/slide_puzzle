import 'package:flutter/material.dart';

import 'neon_button.dart';
import 'package:slide_puzzle/web.dart';

class NeonButonMain extends StatefulWidget {
  @override
  NeonButonMainState createState() {
    return NeonButonMainState();
  }
}

class NeonButonMainState extends State<NeonButonMain> {
  void onButtonPressed(Widget page) {
    Navigator.push(
        context, MaterialPageRoute(builder: (BuildContext context) => page));
  }

  @override
  Widget build(BuildContext context) {
    const separator = const SizedBox(
      height: 50,
    );
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("考考你\nKuiz"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                setState(() {});
              })
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            separator,
            NeonButton(
              text: '史前时代总复习',
              color: Colors.blue,
              onTap: () {
                onButtonPressed(MyWebApp(
                    'https://wordwall.net/play/4548/821/915?fbclid=IwAR0n9VapmTlrEUoyFN0ndFsheORpNJj0-7k2kAFdMc9rgDNxN7vB0craxyA'));
              },
            ),
            NeonButton(
              text: '史前时代复习 1',
              color: Colors.red,
              onTap: () {
                onButtonPressed(MyWebApp(
                    'https://wordwall.net/play/5160/908/937?fbclid=IwAR1y5FZbagPpaz8C7pUQM8OfkSrF74z8tQar5W4dyl4d0d_vstPkOOXeQTc'));
              },
            ),
            NeonButton(
              text: '史前时代复习 2',
              color: Colors.green,
              onTap: () {
                onButtonPressed(MyWebApp(
                    'https://wordwall.net/play/4551/541/228?fbclid=IwAR1aNb2lS-_6aB2N0emGoWLOVoxKzqN3nyMOFiKK3qwKCphE-hP8_Bl7soY'));
              },
            ),
            NeonButton(
              text: '史前时代复习 3',
              color: Colors.yellow,
              onTap: () {
                onButtonPressed(
                    MyWebApp('https://wordwall.net/play/5163/299/905'));
              },
            ),
            separator,
          ],
        ),
      ),
    );
  }
}
