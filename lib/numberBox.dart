import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NumberBox extends StatefulWidget {
  NumberBox({Key key, this.value, this.index}) : super(key: key);
  final int index;
  final int value;

  @override
  _NumberBoxState createState() => _NumberBoxState();
}

class _NumberBoxState extends State<NumberBox> {
  //variables that you want to retain and not change when Widget build is build
  bool crossed = false;
  void changeCross() {
    setState(() {
      crossed = !crossed;
    });
  }

  @override
  void initState() {
    crossed = false;
    super.initState();
  }

  @override
  void didUpdateWidget(NumberBox oldWidget) {
    crossed = false;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.red,
      highlightColor: Colors.black,
      onTap: changeCross,
//      radius: 20,
      child: Padding(
        padding: EdgeInsets.all(1),
        child: Container(
//        height: MediaQuery.of(context).size.width,
          child: Text(
            '${widget.value}',
            style: TextStyle(fontSize: 25, color: Colors.white),
            textAlign: TextAlign.center,
            textScaleFactor: 2,
          ),
          decoration: BoxDecoration(
//              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 5, color: Colors.black),
              shape: BoxShape.rectangle,
              color: crossed ? Colors.pinkAccent : Colors.black),
        ),
      ),
    );
  }
}
