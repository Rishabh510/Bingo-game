import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'numberBox.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks. This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _index = 0;
  List _numbers = new List<int>.generate(25, (int index) => index + 1);
  bool crossed = false;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _index++;
    });
  }

  void _restart() {
    setState(() {
      _numbers.shuffle();
      print(_numbers);
      _index = 0;
      crossed = false;
    });
    //initState(); gives error
  }

  @override
  void initState() {
    super.initState();
    _numbers.shuffle();
    print(_numbers);
    _index = 0;
    crossed = false;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
//          Text(
//            '$_numbers',
//          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 10,
            child: Text(
              ' B I N G O ',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 10),
              textScaleFactor: 2,
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            itemCount: _numbers.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
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
        child: Icon(Icons.refresh),
      ),
    );
  }
}
