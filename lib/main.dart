import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:slide_puzzle/puzzlemain.dart';
import 'package:slide_puzzle/src/list_details/list_page.dart';
import 'package:slide_puzzle/src/pdf.dart';

class Movie {
  final String path;
  final String title;
  final Widget widget;
  const Movie({this.path, this.title, this.widget});
}

final movies = [
  Movie(
      path: 'asset/Logam.jpg',
      title: 'KENALI PRASEJARAH\n认识史前时代',
      widget: ListPage()),
  Movie(path: 'asset/Neolitik.jpg', title: 'Puzzle', widget: PuzzleApp()),
  Movie(path: 'asset/Neolitik.jpg', title: 'Predator', widget: MyApp()),
  const Movie(
    path: 'asset/Neolitik.jpg',
    title: 'Anabelle',
  ),
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

class _MoviesConceptPageState extends State<MoviesConceptPage> {
  final pageController = PageController(viewportFraction: 0.7);
  final ValueNotifier<double> _pageNotifier = ValueNotifier(0.0);

  void _listener() {
    _pageNotifier.value = pageController.page;
    setState(() {});
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
                    child: GestureDetector(
                      onTap: () {
                        if (index != 1)
                          onButtonPressed(movies[index].widget);
                        else
                          runApp(movies[index].widget);
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
