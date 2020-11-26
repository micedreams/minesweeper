import 'package:flutter/material.dart';
import 'dart:math';

class Home extends StatefulWidget {
  static const routeName = '/Home';

  @override
  State<StatefulWidget> createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  String reset = "reset";
  int numOfMines = 10;
  int rows = 6;
  int total;
  int count;
  var rng = new Random();
  var str = ["", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "",];
  var arr = ["", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "",];
  

  @override
  void initState() {
    total = rows * rows;
    super.initState();
  }

  int bombs(value, i) {
    if (value >= 0 && value < total && arr[value] == "X") {
      if( value % rows == 0 && value == (i - (rows - 1)) 
        || value % rows == 0 && value == (i + (rows + 1))
        || value % rows == 0 && value == (i + 1) 
        || value % rows == (rows -1) && value == (i - (rows + 1))
        || value % rows == (rows -1) && value == (i + (rows - 1))
        || value % rows == (rows -1) && value == (i - 1)
        ){
          count = 0; 
        }else { 
          count = 1;
      } 
    } else {
      count = 0;
    }
    return count;
  }

  calculatecount(i) {
    int count = 0;
    count += bombs(i + (1), i);
    count += bombs(i + (rows + 1), i);
    count += bombs(i + (rows - 1), i);
    count += bombs(i + (rows), i);
    count += bombs(i - (1), i);
    count += bombs(i - (rows + 1), i);
    count += bombs(i - (rows - 1), i);
    count += bombs(i - (rows), i);
    return count;
  }

  String show(index) {
    setState(() {});
    str[index] = arr[index];
    return str[index];
  }

  checkstatus(value) {
    if (value == "X") {
      for (var i = 0; i < total; i++) {
        str[i] = arr[i];
      }
    }
  }

  @override
  Widget build(context) {
    
    for (var i = 0; i < numOfMines; i++) {
      var rando = rng.nextInt(total);
      //var rando = 18;
      if (arr[rando] == "" && arr[rando] != "X") {
        arr[rando] = "X";
      }
    }

    for (var i = 0; i < total; i++) {
      if (arr[i] != "X") {
        count = calculatecount(i);
        arr[i] = "$count";
      }
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Mine Sweeper"),
      ),
      body: new Container(
          child: GridView.count(
        crossAxisCount: rows,
        children: List.generate(total, (index) {
          return new GridTile(
            child: new Card(
                color: Colors.blue.shade200,
                child: Center(
                  child: RaisedButton(
                    color: Colors.blue.shade200,
                    onPressed: () {
                    show(index);
                    checkstatus(str[index]);
                    },
                    child: Text(str[index]),
                  ),
                )),
          );
        }),
      )),
    );
  }
}


      

