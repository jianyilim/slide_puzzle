import 'dart:io';
import 'dart:ui';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:slide_puzzle/puzzlemain.dart';
import 'package:slide_puzzle/src/list_details/list_page.dart';
import 'package:slide_puzzle/src/pdf.dart';
import 'package:slide_puzzle/src/shrink_top_list/shrink_top_list_page.dart';
import 'package:slide_puzzle/src/shrink_top_list-diy/shrink_top_list_page.dart';
import 'package:slide_puzzle/dndmain.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:permission_handler/permission_handler.dart';

class Movie {
  final String path;
  final String title;
  final Widget widget;
  const Movie({this.path, this.title, this.widget});
}

final movies = [
  Movie(
      path: 'asset/menu0.jpg',
      title: '学习目标\nStandard Pembelajaran',
      widget: ShrinkTopListPage()),
  Movie(
      path: 'asset/menu1.jpg',
      title: 'Kenali Prasejarah\n认识史前时代',
      widget: ListPage()),
  Movie(
      path: 'asset/menu2.jpg',
      title: '历史科普书\nBuku Sains Sejarah',
      widget: ShrinkTopListPage()),
  Movie(
      path: 'asset/menu3.jpg',
      title: '亲手制作\nMari Cuba',
      widget: ShrinkTopListPage2()),
  Movie(path: 'asset/menu4.jpg', title: '拼拼看\nPuzzle', widget: PuzzleApp()),
  Movie(
      path: 'asset/menu5.jpg',
      title: '迷你游戏\nPermainan Mini',
      widget: MyDnDApp()),
];

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MoviesConceptPage(),
    ));

class MoviesConceptPage extends StatefulWidget {
  @override
  _MoviesConceptPageState createState() => _MoviesConceptPageState();
}

class PDFScreen extends StatelessWidget {
  String path1;
  PDFScreen(this.path1);
  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
        appBar: AppBar(
          title: Text('Murid boleh'),
          actions: <Widget>[],
        ),
        path: path1);
  }
}

class _MoviesConceptPageState extends State<MoviesConceptPage> {
  final pageController = PageController(viewportFraction: 0.7);
  final ValueNotifier<double> _pageNotifier = ValueNotifier(0.0);

  void _listener() {
    _pageNotifier.value = pageController.page;
    setState(() {});
  }

  Future<String> createFileOfPdfUrl() async {
    var bytes;
    String filename = "Murid boleh";
    String dir = (await getApplicationDocumentsDirectory()).path;
    ;
    dir = '$dir/$filename';
    File file = new File(dir);
    var bytes2 = await rootBundle.load("asset/Murid boleh.pdf");
    await writeToFile(bytes2, dir);

    return file.path;
  }

//write to app path
  Future<void> writeToFile(ByteData data, String path) {
    final buffer = data.buffer;
    return new File(path).writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }

  void onButtonPressedPDF() {
    createFileOfPdfUrl().then((f) {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => PDFScreen(f)));
    });
  }

  void onButtonPressed(Widget page) {
    Navigator.push(
        context, MaterialPageRoute(builder: (BuildContext context) => page));
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      pageController.addListener(_listener);
    });
    super.initState();
    plyr.loop('bgm.mp3');
  }

  @override
  void dispose() {
    pageController.removeListener(_listener);
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(30);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: ValueListenableBuilder<double>(
                valueListenable: _pageNotifier,
                builder: (context, value, child) {
                  return Stack(
                    children: movies.reversed
                        .toList()
                        .asMap()
                        .entries
                        .map(
                          (entry) => Positioned.fill(
                            child: ClipRect(
                              clipper: MyClipper(
                                percentage: value,
                                title: entry.value.title,
                                index: entry.key,
                              ),
                              child: Image(
                                  image: AssetImage(entry.value.path),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        )
                        .toList(),
                  );
                }),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: size.height / 3,
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white60,
                  Colors.white24,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              )),
            ),
          ),
          PageView.builder(
              itemCount: movies.length,
              controller: pageController,
              itemBuilder: (context, index) {
                final lerp =
                    lerpDouble(0, 1, (index - _pageNotifier.value).abs());

                double opacity =
                    lerpDouble(0.0, 0.5, (index - _pageNotifier.value).abs());
                if (opacity > 1.0) opacity = 1.0;
                if (opacity < 0.0) opacity = 0.0;
                return Transform.translate(
                  offset: Offset(0.0, lerp * 50),
                  child: Opacity(
                    opacity: (1 - opacity),
                    child: InkWell(
                      onTap: () {
                        if (index == 0)
                          onButtonPressedPDF();
                        else if (index == 4)
                          runApp(movies[index].widget);
                        else
                          onButtonPressed(movies[index].widget);
                      },
                      child: Align(
                        //alignment: Alignment.bottomCenter,
                        child: Card(
                          semanticContainer: true,
                          color: Colors.white,
                          borderOnForeground: true,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: borderRadius,
                          ),
                          clipBehavior: Clip.hardEdge,
                          child: SizedBox(
                            height: size.height / 1.5,
                            width: size.width,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Image(
                                      image: AssetImage(movies[index].path),
                                      fit: BoxFit.fill),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text(
                                      movies[index].title,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                        fontSize: 24,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Rect> {
  final double percentage;
  final String title;
  final int index;

  MyClipper({
    this.percentage = 0.0,
    this.title,
    this.index,
  });

  @override
  Rect getClip(Size size) {
    int currentIndex = movies.length - 1 - index;
    final realPercent = (currentIndex - percentage).abs();
    if (currentIndex == percentage.truncate()) {
      return Rect.fromLTWH(
          0.0, 0.0, size.width * (1 - realPercent), size.height);
    }
    if (percentage.truncate() > currentIndex) {
      return Rect.fromLTWH(0.0, 0.0, 0.0, size.height);
    }
    return Rect.fromLTWH(0.0, 0.0, size.width, size.height);
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}
