import 'dart:io';

import 'package:flutter/material.dart';
import 'package:slide_puzzle/src/shrink_top_list-diy/character.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:permission_handler/permission_handler.dart';

const itemSize = 150.0;

class PDFScreen2 extends StatelessWidget {
  Character character;
  PDFScreen2(this.character);

  Future<void> shareFile(Character character) async {
    await FlutterShare.shareFile(
      title: character.title,
      text: character.title,
      filePath: character.finalPath,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
        appBar: AppBar(
          title: Text(character.title),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {
                shareFile(character);
              },
            ),
          ],
        ),
        path: character.finalPath);
  }
}

class ShrinkTopListPage2 extends StatefulWidget {
  @override
  _ShrinkTopListPageState2 createState() => _ShrinkTopListPageState2();
}

class _ShrinkTopListPageState2 extends State<ShrinkTopListPage2> {
  final scrollController = ScrollController();
  Future<String> createFileOfPdfUrl(Character character) async {
    final PermissionHandler _permissionHandler = PermissionHandler();
    var result =
        await _permissionHandler.requestPermissions([PermissionGroup.storage]);
    var bytes;
    String filename = character.filename;
    String dir = gdir;
    File file = new File('$dir/$filename');
    var bytes2 = await rootBundle.load(character.path);
    await writeToFile(bytes2, '$dir/$filename');
    character.finalPath = file.path;
    return file.path;
  }

  //write to app path
  Future<void> writeToFile(ByteData data, String path) {
    final buffer = data.buffer;
    return new File(path).writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }

  void onButtonPressedPDF(Character character) {
    createFileOfPdfUrl(character).then((f) {
      character.finalPath = f;
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => PDFScreen2(character)));
    });
  }

  _asyncMethod() async {
    gdir = (await getExternalStorageDirectory()).path;
  }

  void onListen() {
    setState(() {});
  }

  String gdir = '';
  @override
  void initState() {
    characters.addAll(List.from(characters));
    scrollController.addListener(onListen);
    super.initState();
    _asyncMethod();
    /*for (var i = 0; i < characters.length; i++) {
      createFileOfPdfUrl(characters[i]).then((f) {
        setState(() {
          characters[i].finalPath = f;
        });
      });
    }*/
  }

  @override
  void dispose() {
    scrollController.removeListener(onListen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('亲手制作'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
        child: CustomScrollView(
          controller: scrollController,
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final heightFactor = 0.6;
                  final character = characters[index];
                  final itemPositionOffset = index * itemSize * heightFactor;
                  final difference =
                      scrollController.offset - itemPositionOffset;
                  final percent =
                      1.0 - (difference / (itemSize * heightFactor));
                  double opacity = percent;
                  double scale = percent;
                  if (opacity > 1.0) opacity = 1.0;
                  if (opacity < 0.0) opacity = 0.0;
                  if (percent > 1.0) scale = 1.0;

                  return Align(
                    heightFactor: heightFactor,
                    child: Opacity(
                      opacity: opacity,
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()..scale(scale, 1.0),
                        child: InkWell(
                          onTap: () {
                            onButtonPressedPDF(characters[index]);
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                              ),
                            ),
                            color: Color(character.color),
                            child: SizedBox(
                              height: itemSize,
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: Text(
                                        character.title,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                        ),
                                      )),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                    ),
                                  ),
                                  Image.asset(character.avatar),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                childCount: characters.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
