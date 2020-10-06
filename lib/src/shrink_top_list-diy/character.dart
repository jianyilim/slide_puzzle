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
    avatar: "asset/ICONN/1.png",
    color: 0xFF355070,
    filename: "dig_family.pdf",
  ),
  Character(
    title: "破解代码\nCode Breaking",
    path: "asset/DIY/Code Breaking.pdf",
    avatar: "asset/ICONN/2.png",
    color: 0xFFE4572E,
    filename: "Code Breaking.pdf",
  ),
  Character(
    title: "可爱的3D猛犸象\nMammoth 3D yang Comel",
    path: "asset/DIY/Mammoth 3D yang Comel.pdf",
    avatar: "asset/ICONN/3.png",
    color: 0xFFE07BE0,
    filename: "Mammoth 3D yang Comel.pdf",
  ),
  Character(
    title: "Morning star",
    path: "asset/DIY/MorningStar.pdf",
    avatar: "asset/ICONN/4.png",
    color: 0xFFA8C686,
    filename: "MorningStar.pdf",
  ),
  Character(
    title: "Round house",
    path: "asset/DIY/Round house.pdf",
    avatar: "asset/ICONN/5.png",
    color: 0xFF9D9C62,
    filename: "Round house.pdf",
  ),
  
];
