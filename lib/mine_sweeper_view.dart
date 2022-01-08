import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mine_sweeper/mine_sweeper_bloc.dart';
import 'package:mine_sweeper/mine_sweeper_event.dart';
import 'package:mine_sweeper/mine_sweeper_state.dart';

class MineSweeperView extends StatefulWidget {
  static const routeName = '/Home';

  @override
  State<StatefulWidget> createState() => new _MineSweeperViewState();
}

class _MineSweeperViewState extends State<MineSweeperView> {
  @override
  Widget build(context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Mine Sweeper"),
        ),
        body: BlocBuilder<MineSweeperBloc, MineSweeperState>(
          builder: (context, state) {
            return GridView.count(
              crossAxisCount: 6,
              children: List.generate(36, (index) {
                return new Card(
                    child: ElevatedButton(
                  onPressed: () => BlocProvider.of<MineSweeperBloc>(context)
                      .add(ClickEvent(index)),
                  onLongPress: () => BlocProvider.of<MineSweeperBloc>(context)
                      .add(ResetEvent()),
                  child: Center(
                    child: Text(state.str[index]),
                  ),
                ));
              }),
            );
          },
        ));
  }
}
