import 'package:flutter/material.dart';

import 'mine_sweeper.dart';


void main() async {
   runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mine Sweeper",
      home: MineSweeper(),
    );
  }
}