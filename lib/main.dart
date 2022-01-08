import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mine_sweeper/mine_sweeper_bloc.dart';
import 'package:mine_sweeper/mine_sweeper_event.dart';
import 'package:mine_sweeper/mine_sweeper_view.dart';
import 'mine_sweeper.dart';

void main() async {
  runApp(BLoCPatternFlutter());
}

class BLoCPatternFlutter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mine Sweeper",
      debugShowCheckedModeBanner: false,
      home: BlocProvider<MineSweeperBloc>(
        create: (context) => MineSweeperBloc()..add(ResetEvent()),
        child: MineSweeperView(),
      ),
    );
  }
}

class Vanilla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mine Sweeper",
      debugShowCheckedModeBanner: false,
      home: MineSweeper(),
    );
  }
}
