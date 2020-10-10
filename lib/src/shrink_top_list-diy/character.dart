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
    title: "创建自己的挖掘\nMenjalankan penggalian ",
    path: "asset/DIY/dig_family.pdf",
    avatar: "asset/ICONN/d1.png",
    color: 0xFF73E2A7,
    filename: "dig_family.pdf",
  ),
  Character(
    title: "破解代码\nCode Breaking",
    path: "asset/DIY/Code Breaking.pdf",
    avatar: "asset/ICONN/d2.png",
    color: 0xFFFFA69E,
    filename: "Code Breaking.pdf",
  ),
  Character(
    title: "可爱的3D猛犸象\nMammoth 3D yang Comel",
    path: "asset/DIY/Mammoth 3D yang Comel.pdf",
    avatar: "asset/ICONN/d3.png",
    color: 0xFF85C7DE,
    filename: "Mammoth 3D yang Comel.pdf",
  ),
  Character(
    title: "Morning star",
    path: "asset/DIY/MorningStar.pdf",
    avatar: "asset/ICONN/d4.png",
    color: 0xFFBFDBF7,
    filename: "MorningStar.pdf",
  ),
  Character(
    title: "Round house",
    path: "asset/DIY/Round house.pdf",
    avatar: "asset/ICONN/d5.png",
    color: 0xFFDBEFBC,
    filename: "Round house.pdf",
  ),
  Character(
    title: "动物面具\nMask Haiwan",
    path: "asset/DIY/MASK.pdf",
    avatar: "asset/ICONN/d6.png",
    color: 0xFFAA4586,
    filename: "MaSK.pdf",
  ),
  Character(
    title: "史前时代面具\nMask Zaman Prasejarah ",
    path: "asset/DIY/Mask2.pdf",
    avatar: "asset/ICONN/d7.png",
    color: 0xFFE56399,
    filename: "MaSK2.pdf",
  ),
];
