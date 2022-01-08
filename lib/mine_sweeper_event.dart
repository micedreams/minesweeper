abstract class MineSweeperEvent {}

class ResetEvent extends MineSweeperEvent {}

class ClickEvent extends MineSweeperEvent {
  final int index;
  ClickEvent(this.index);
}
