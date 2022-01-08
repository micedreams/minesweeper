import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mine_sweeper/mine_sweeper_event.dart';
import 'package:mine_sweeper/mine_sweeper_functions.dart';
import 'package:mine_sweeper/mine_sweeper_state.dart';

class MineSweeperBloc extends Bloc<MineSweeperEvent, MineSweeperState> {
  MineSweeperFunctions function = new MineSweeperFunctions();
  var str = List.filled(9, "", growable: false);
  MineSweeperBloc()
      : super(MineSweeperState(str: List.filled(36, "", growable: false))) {
    on<ResetEvent>((event, emit) {
      var dispose = function.dispose();
      str = dispose;
      function.assignBombs();
      emit(MineSweeperState(str: dispose));
    });
    on<ClickEvent>((event, emit) {
      var click = function.show(event.index);
      emit(MineSweeperState(str: click));
    });
  }
}
