import 'package:flutter/material.dart';
import 'package:mine_sweeper/mine_sweeper_functions.dart';

class MineSweeper extends StatefulWidget {
  static const routeName = '/Home';

  @override
  State<StatefulWidget> createState() => new _MineSweeperState();
}

class _MineSweeperState extends State<MineSweeper> {
  MineSweeperFunctions mineSweeper = MineSweeperFunctions();
  var str = List.filled(36, "", growable: false);

  @override
  void initState() {
    mineSweeper.assignBombs();
    super.initState();
  }

  @override
  Widget build(context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Mine Sweeper"),
      ),
      body: GridView.count(
        crossAxisCount: 6,
        children: List.generate(36, (index) {
          return new Card(
              child: ElevatedButton(
            onPressed: () => setState(() {
              str = mineSweeper.show(index);
            }),
            onLongPress: () {
              setState(() {
                str = mineSweeper.dispose();
              });
              mineSweeper.assignBombs();
            },
            child: Center(
              child: Text(str[index]),
            ),
          ));
        }),
      ),
    );
  }
}
