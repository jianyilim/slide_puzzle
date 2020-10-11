import 'package:flutter/material.dart';

class Character {
  final String avatar;
  final String title;
  final String path;
  final int color;

  Character({
    this.avatar,
    this.title,
    this.path,
    this.color,
  });
}

//source: https://www.giantbomb.com/dragon-ball-z/3025-159/characters/
final characters = <Character>[
  Character(
    title: "如果你必须在石器時代\n生活一天是什么样的呢?",
    path:
        "https://www.youtube.com/watch?v=V9YtEoHZjXY&fbclid=IwAR02cyT3Pl1jZJxtAUuHRYMGFKxD8FvrmeZXYwOZiI6WzbesPO4EOZU97AA",
    avatar: "asset/ICONN/m1.png",
    color: 0xFFC42021,
  ),
  Character(
    title: "新旧石器时代人类生活比较",
    path:
        "https://www.youtube.com/watch?v=S_QiEx9iPCM&fbclid=IwAR3ycb0kV-eAUUHt_RHa6LzBaVHZj7_meT4cqFPBo1ovbEPI1_5srKa9huo",
    avatar: "asset/ICONN/m2.png",
    color: 0xFFffd166,
  ),
  Character(
    title: "从穴居到王国 - 新石器时代",
    path:
        "https://www.youtube.com/watch?v=tnpRxvcZcEk&fbclid=IwAR0yKUf6ElrOAM6vYp_8UTFPtR-7hOy5FjGABtGp7vuzjQynKE3g7rP018c",
    avatar: "asset/ICONN/m3.png",
    color: 0xFF3C1742,
  ),
  Character(
    title: "人类 vs. 尼安德塔人",
    path:
        "https://www.youtube.com/watch?v=_DBWMB31ZKI&fbclid=IwAR1mZzF_JT3xaBE9JpEaSBYoc3qG_qN2isbu7VSggQWnjH0LXEv7RRbDLTg",
    avatar: "asset/ICONN/m4.png",
    color: 0xFF54577C,
  ),
  Character(
    title: "呜哇嚓嚓\n原始童谣",
    path:
        "https://www.youtube.com/watch?v=rZEUNgQPxGc&fbclid=IwAR1mZzF_JT3xaBE9JpEaSBYoc3qG_qN2isbu7VSggQWnjH0LXEv7RRbDLTg",
    avatar: "asset/ICONN/m5.png",
    color: 0xFFADF1D2,
  ),
  Character(
    title: "火是怎么来的?",
    path:
        "https://www.youtube.com/watch?v=hRYLMibYIfE&fbclid=IwAR3LgJEv1rjQ4xkr2nNwXPSbMjFaa_Mn0Z1zBzzUICnoiue8WrBXfp3HDFk",
    avatar: "asset/ICONN/m8.png",
    color: 0xFFD9DBBC,
  ),
  Character(
    title: "石器時代",
    path:
        "https://www.youtube.com/watch?v=MV2lx1peKCk&fbclid=IwAR2q8KaAFpWqfEc8L9RsML4Lg6xgKRZ1KI_NU5SOwKuJu2kpfnOrd8IzgRg",
    avatar: "asset/ICONN/m6.png",
    color: 0xFFA1C349,
  ),
  Character(
    title: "Prehistory",
    path:
        "https://www.youtube.com/watch?v=MV2lx1peKCk&fbclid=IwAR2q8KaAFpWqfEc8L9RsML4Lg6xgKRZ1KI_NU5SOwKuJu2kpfnOrd8IzgRg",
    avatar: "asset/ICONN/m7.png",
    color: 0xFFBB4D00,
  ),
];
