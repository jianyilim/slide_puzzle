import 'dart:io';

import 'package:flutter/material.dart';
import 'package:circle_wheel_scroll/circle_wheel_scroll_view.dart' as wheel;
import 'package:slide_puzzle/src/circular_list/character.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';

class CircularListPage extends StatefulWidget {
  @override
  _CircularListPageState createState() => _CircularListPageState();
}

class PDFScreen extends StatelessWidget {
  Character character;
  PDFScreen(this.character);

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
        appBar: AppBar(
          title: Text(character.title),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {},
            ),
          ],
        ),
        path: character.path);
  }
}

class _CircularListPageState extends State<CircularListPage> {
  wheel.FixedExtentScrollController _controller;

  _listListener() {
    setState(() {});
  }

  String gdir = '';
  @override
  void initState() {
    _controller = wheel.FixedExtentScrollController();
    _controller.addListener(_listListener);
    _asyncMethod();
    for (var i = 0; i < characters.length; i++) {
      createFileOfPdfUrl(characters[i]);
    }
    super.initState();
  }

  Future<String> createFileOfPdfUrl(Character character) async {
    var bytes;
    String filename = character.filename;
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = new File('$dir/$filename');
    var bytes2 = await rootBundle.load(character.path);
    writeToFile(bytes2, '$dir/$filename');
    character.finalPath = file.path;
    return file.path;
  }

  //write to app path
  Future<void> writeToFile(ByteData data, String path) {
    final buffer = data.buffer;
    return new File(path).writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }

  _asyncMethod() async {
    gdir = (await getApplicationDocumentsDirectory()).path;
  }

  @override
  void dispose() {
    _controller.removeListener(_listListener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF9D9C62),
      appBar: AppBar(
        title: Text("Books"),
      ),
      body: wheel.CircleListScrollView.useDelegate(
        childDelegate: wheel.CircleListChildBuilderDelegate(
          builder: (context, index) {
            int currentIndex = 0;
            try {
              currentIndex = _controller.selectedItem;
            } catch (_) {}
            final resizeFactor =
                (1 - (((currentIndex - index).abs() * 0.3).clamp(0.0, 1.0)));
            return CircleListItem(
              resizeFactor: resizeFactor as double,
              character: characters[index],
            );
          },
          childCount: characters.length,
        ),
        physics: wheel.CircleFixedExtentScrollPhysics(),
        controller: _controller,
        axis: Axis.vertical,
        itemExtent: 120,
        radius: MediaQuery.of(context).size.width * 0.8,
        onSelectedItemChanged: (index) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      PDFScreen(characters[index])));
        },
      ),
    );
  }
}

class CircleListItem extends StatelessWidget {
  final double resizeFactor;
  final Character character;

  const CircleListItem({Key key, this.resizeFactor, this.character})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            character.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22 * resizeFactor,
            ),
          ),
        ),
        Container(
          width: 120 * resizeFactor,
          height: 120 * resizeFactor,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            color: Colors.white,
          ),
          child: Align(
            child: Container(
              child: Image.asset(
                character.avatar,
                fit: BoxFit.contain,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                color: Color(character.color),
              ),
              height: 110 * resizeFactor,
              width: 110 * resizeFactor,
            ),
          ),
        ),
      ]),
    );
  }
}
