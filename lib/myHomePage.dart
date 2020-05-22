import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'numberBox.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List _numbers = new List<int>.generate(25, (int index) => index + 1);
  bool crossed = false;

  void _restart() {
    setState(() {
      _numbers.shuffle();
      print(_numbers);
      crossed = false;
    });
    //initState(); gives error
  }

  @override
  void initState() {
    super.initState();
    _numbers.shuffle();
    print(_numbers);
    crossed = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bingo with family'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
//          Text(
//            '$_numbers',
//          ),
          SizedBox(
            height: 70,
          ),
          Container(
            color: Colors.pink[100],
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 10,
            child: Text(
              ' B I N G O ',
//              style: TextStyle(
//                fontStyle: FontStyle.italic,
//                fontSize: 34,
//                color: Colors.red,
//                fontWeight: FontWeight.bold,
//                letterSpacing: 10,
//              ),
              style: GoogleFonts.indieFlower(
                fontSize: 32,
                color: Colors.pink,
                fontWeight: FontWeight.bold,
                letterSpacing: 10,
              ),
              textScaleFactor: 2,
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            itemCount: _numbers.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
            itemBuilder: (context, i) {
              return NumberBox(
                index: i,
                value: _numbers[i],
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _restart,
        tooltip: 'Restart match',
        elevation: 20,
        focusColor: Colors.black,
        backgroundColor: Colors.pink,
        splashColor: Colors.green,
        hoverColor: Colors.yellow,
        child: Icon(Icons.scatter_plot),
      ),
    );
  }
}
