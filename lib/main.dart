import 'package:bingoapp/models/numbers.dart';
import 'package:bingoapp/screens/game.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
        highlightColor: Colors.blueGrey,
        scaffoldBackgroundColor: Color(0xff678db5),
      ),
      home: ChangeNotifierProvider(
        create: (BuildContext context) {
          return Numbers();
        },
        child: Game(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
