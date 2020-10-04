import 'package:flutter/material.dart';

class Character {
  final String avatar;
  final String title;
  final String path;
  final String filename;
  final int color;
  final Widget widget;
  String finalPath;

  Character(
      {this.avatar,
      this.title,
      this.path,
      this.color,
      this.widget,
      this.filename,
      this.finalPath});
}

//source: https://www.giantbomb.com/dragon-ball-z/3025-159/characters/
final characters = <Character>[
  Character(
    title: "侏罗纪世界\n当克隆遇到恐龙",
    path: "asset/侏罗纪世界__当克隆遇到恐龙.pdf",
    avatar: "asset/ICONN/1.png",
    color: 0xFF355070,
    filename: "侏罗纪世界__当克隆遇到恐龙.pdf",
  ),
  Character(
    title: "人与动物亲如一家\n熊的传说",
    path: "asset/人与动物亲如一家_动画片_熊的传说_沙洲.pdf",
    avatar: "asset/ICONN/2.png",
    color: 0xFFE4572E,
    filename: "人与动物亲如一家_动画片_熊的传说_沙洲.pdf",
  ),
  Character(
    title: "农为邦本\n天地人和",
    path: "asset/农为邦本__天地人和_曹幸穗.pdf",
    avatar: "asset/ICONN/3.png",
    color: 0xFFE07BE0,
    filename: "农为邦本__天地人和_曹幸穗.pdf",
  ),
  Character(
    title: "动物可笑堂",
    path: "asset/动物可笑堂_单伟.pdf",
    avatar: "asset/ICONN/4.png",
    color: 0xFFA8C686,
    filename: "动物可笑堂_单伟.pdf",
  ),
  Character(
    title: "化石\n史前时代的见证者",
    path: "asset/化石_史前时代的见证者.pdf",
    avatar: "asset/ICONN/5.png",
    color: 0xFF9D9C62,
    filename: "化石_史前时代的见证者.pdf",
  ),
  Character(
    title: "可爱的蜡烛",
    path: "asset/可爱的蜡烛_诺琳.pdf",
    avatar: "asset/ICONN/6.png",
    color: 0xFFFFA69E,
    filename: "可爱的蜡烛_诺琳.pdf",
  ),
  Character(
    title: "史前取火记",
    path: "asset/史前取火记_向弈萌.pdf",
    avatar: "asset/ICONN/7.png",
    color: 0xFFAA4465,
    filename: "史前取火记_向弈萌.pdf",
  ),
  Character(
    title: "史前时代\n向动物世界说再见",
    path: "asset/史前时代_向动物世界说再见.pdf",
    avatar: "asset/ICONN/8.png",
    color: 0xFF861657,
    filename: "史前时代_向动物世界说再见.pdf",
  ),
  Character(
    title: "声音之源",
    path: "asset/声音之源_超然.pdf",
    avatar: "asset/ICONN/9.png",
    color: 0xFF364156,
    filename: "声音之源_超然.pdf",
  ),
  Character(
    title: "奇妙的巨石镇",
    path: "asset/奇妙的_巨石镇_罗文翔.pdf",
    avatar: "asset/ICONN/10.png",
    color: 0xFF7D4E57,
    filename: "奇妙的_巨石镇_罗文翔.pdf",
  ),
  Character(
    title: "带你感受埃及文明",
    path: "asset/带你感受埃及文明_王维浩.pdf",
    avatar: "asset/ICONN/11.png",
    color: 0xFFD66853,
    filename: "带你感受埃及文明_王维浩.pdf",
  ),
  Character(
    title: "Hello原始人",
    path: "asset/Hello原始人.pdf",
    avatar: "asset/ICONN/12.png",
    color: 0xFF6461A0,
    filename: "Hello原始人.pdf",
  ),
  Character(
    title: "手术和麻醉剂",
    path: "asset/手术和麻醉剂_杨台胜.pdf",
    avatar: "asset/ICONN/13.png",
    color: 0xFF0A81D1,
    filename: "手术和麻醉剂_杨台胜.pdf",
  ),
  Character(
    title: "教室里的霸王龙",
    path: "asset/教室里的霸王龙_李志伟.pdf",
    avatar: "asset/ICONN/14.png",
    color: 0xFF6CAE75,
    filename: "教室里的霸王龙_李志伟.pdf",
  ),
  Character(
    title: "最后的普氏野马",
    path: "asset/最后的普氏野马_刘伟伟.pdf",
    avatar: "asset/ICONN/15.png",
    color: 0xFF8B9474,
    filename: "最后的普氏野马_刘伟伟.pdf",
  ),
  Character(
    title: "最早出现的恐龙",
    path: "asset/最早出现的恐龙.pdf",
    avatar: "asset/ICONN/16.png",
    color: 0xFFF5A65B,
    filename: "最早出现的恐龙.pdf",
  ),
  Character(
    title: "望远之镜",
    path: "asset/望远之镜.pdf",
    avatar: "asset/ICONN/17.png",
    color: 0xFFBD2D87,
    filename: "望远之镜.pdf",
  ),
  Character(
    title: "杠杆在古代",
    path: "asset/杠杆在古代.pdf",
    avatar: "asset/ICONN/18.png",
    color: 0xFFB191FF,
    filename: "杠杆在古代.pdf",
  ),
  Character(
    title: "生活在寒冷北方的大犀牛",
    path: "asset/生活在寒冷北方的大犀牛_披毛犀_盗龙.pdf",
    avatar: "asset/ICONN/19.png",
    color: 0xFF9AC2C9,
    filename: "生活在寒冷北方的大犀牛_披毛犀_盗龙.pdf",
  ),
  Character(
    title: "疯狂巨菜谷之谜",
    path: "asset/疯狂_巨菜谷_之谜_李小跳.pdf",
    avatar: "asset/ICONN/20.png",
    color: 0xFF7A542E,
    filename: "疯狂_巨菜谷_之谜_李小跳.pdf",
  ),
  Character(
    title: "白鹰子",
    path: "asset/白鹰子_崔芳菲.pdf",
    avatar: "asset/ICONN/21.png",
    color: 0xFFE71D36,
    filename: "白鹰子_崔芳菲.pdf",
  ),
  Character(
    title: "能量小史",
    path: "asset/能量小史.pdf",
    avatar: "asset/ICONN/22.png",
    color: 0xFF72BDA3,
    filename: "能量小史.pdf",
  ),
  Character(
    title: "长鼻巨兽",
    path: "asset/长鼻巨兽_剑齿象_盗龙.pdf",
    avatar: "asset/ICONN/23.png",
    color: 0xFFC2847A,
    filename: "长鼻巨兽_剑齿象_盗龙.pdf",
  ),
  Character(
    title: "面条的年龄\n兼说中国史前时代的面食",
    path: "asset/面条的年龄_兼说中国史前时代的面食_王仁湘.pdf",
    avatar: "asset/ICONN/24.png",
    color: 0xFF592E83,
    filename: "面条的年龄_兼说中国史前时代的面食_王仁湘.pdf",
  ),
];
