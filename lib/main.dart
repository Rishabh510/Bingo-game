import 'package:flutter/material.dart';
import 'myHomePage.dart';
import 'package:flutter/services.dart';

//void main() {
//  WidgetsFlutterBinding.ensureInitialized();
//  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
//      .then((_) {
//    runApp(MyApp());
//  });
//}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: 'Bingo_app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.blueAccent,
        canvasColor: Colors.yellow[700],
        splashColor: Colors.green,
        highlightColor: Colors.yellow,
        scaffoldBackgroundColor: Colors.blueGrey,
//        fontFamily:
      ),
//      home: MyHomePage,
      home: MyHomePage(title: 'Bingo with family'),
      debugShowCheckedModeBanner: false,
    );
  }
}
