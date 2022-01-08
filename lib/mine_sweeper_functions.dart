import 'dart:math';

class MineSweeperFunctions {
  int count;
  var rng = new Random();
  int numOfMines = 5;
  int total = 36;
  int rows = 6;
  var arr = List.filled(36, "", growable: false);
  var str = List.filled(36, "", growable: false);

  assignBombs() {
    for (var i = 0; i < numOfMines; i++) {
      var rando = rng.nextInt(total);
      if (arr[rando] == "" && arr[rando] != "X") {
        arr[rando] = "X";
      }
    }
    return arr;
  }

  show(index) {
    _bombsAroundMe();
    str[index] = arr[index];
    _checkstatus(str[index]);
    return str;
  }

  dispose() {
    arr = List.filled(total, "", growable: false);
    str = List.filled(total, "", growable: false);
    return str;
  }

  int _bombs(value, i) {
    if (value >= 0 && value < total && arr[value] == "X") {
      if (value % rows == 0 && value == (i - (rows - 1)) ||
          value % rows == 0 && value == (i + (rows + 1)) ||
          value % rows == 0 && value == (i + 1) ||
          value % rows == (rows - 1) && value == (i - (rows + 1)) ||
          value % rows == (rows - 1) && value == (i + (rows - 1)) ||
          value % rows == (rows - 1) && value == (i - 1)) {
        count = 0;
      } else {
        count = 1;
      }
    } else {
      count = 0;
    }
    return count;
  }

  _calculatecount(i) {
    int count = 0;
    count += _bombs(i + (1), i);
    count += _bombs(i + (rows + 1), i);
    count += _bombs(i + (rows - 1), i);
    count += _bombs(i + (rows), i);
    count += _bombs(i - (1), i);
    count += _bombs(i - (rows + 1), i);
    count += _bombs(i - (rows - 1), i);
    count += _bombs(i - (rows), i);
    return count;
  }

  void _bombsAroundMe() {
    for (var i = 0; i < total; i++) {
      if (arr[i] != "X") {
        count = _calculatecount(i);
        arr[i] = "$count";
      }
    }
  }

  _checkstatus(value) {
    if (value == "X") {
      for (var i = 0; i < total; i++) {
        str[i] = arr[i];
      }
    }
  }
}
