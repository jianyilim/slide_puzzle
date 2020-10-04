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
    title: "侏罗纪世界 - 当克隆遇到恐龙",
    path: "asset/侏罗纪世界__当克隆遇到恐龙.pdf",
    avatar: "asset/ICONN/1.png",
    color: 0xFF355070,
    filename: "侏罗纪世界__当克隆遇到恐龙.pdf",
  ),
  Character(
    title: "ZAMAN PALEOLITIK\n旧石器时代",
    path: "asset/侏罗纪世界__当克隆遇到恐龙.pdf",
    avatar: "asset/ICONN/1.png",
    color: 0xFF355070,
    filename: "侏罗纪世界__当克隆遇到恐龙.pdf",
  ),
  Character(
    title: "ZAMAN MESOLITIK\n中石器时代",
    path: "asset/侏罗纪世界__当克隆遇到恐龙.pdf",
    avatar: "asset/ICONN/1.png",
    color: 0xFF355070,
    filename: "侏罗纪世界__当克隆遇到恐龙.pdf",
  ),
  Character(
    title: "ZAMAN NEOLITIK\n新石器时代",
    path: "asset/侏罗纪世界__当克隆遇到恐龙.pdf",
    avatar: "asset/ICONN/1.png",
    color: 0xFF355070,
    filename: "侏罗纪世界__当克隆遇到恐龙.pdf",
  ),
  Character(
    title: "ZAMAN LOGAM\n金属器时代",
    path: "asset/侏罗纪世界__当克隆遇到恐龙.pdf",
    avatar: "asset/ICONN/1.png",
    color: 0xFF355070,
    filename: "侏罗纪世界__当克隆遇到恐龙.pdf",
  ),
  Character(
    title: "Sumber Rujukan\n资料来源",
    path: "asset/侏罗纪世界__当克隆遇到恐龙.pdf",
    avatar: "asset/ICONN/1.png",
    color: 0xFF355070,
    filename: "侏罗纪世界__当克隆遇到恐龙.pdf",
  ),
];
