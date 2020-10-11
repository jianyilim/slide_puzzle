import 'package:flutter/material.dart';
import 'package:slide_puzzle/src/shrink_top_list-video/character.dart';
import 'package:slide_puzzle/web.dart';

const itemSize = 150.0;

class ShrinkTopListPage4 extends StatefulWidget {
  @override
  _ShrinkTopListPageState4 createState() => _ShrinkTopListPageState4();
}

class _ShrinkTopListPageState4 extends State<ShrinkTopListPage4> {
  final scrollController = ScrollController();

  void onButtonPressed(Character character) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => MyWebApp(character.path)));
  }

  void onListen() {
    setState(() {});
  }

  @override
  void initState() {
    characters.addAll(List.from(characters));
    scrollController.addListener(onListen);
    super.initState();
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
        title: Text('历史剧场\nCinema Prasejarah'),
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
                            onButtonPressed(characters[index]);
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
