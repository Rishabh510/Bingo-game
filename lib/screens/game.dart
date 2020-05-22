import 'package:flutter/material.dart';
import 'package:bingoapp/models/numbers.dart';
import 'package:provider/provider.dart';

class Game extends StatelessWidget {
  final List bingo = ['B', 'I', 'N', 'G', 'O'];

  @override
  Widget build(BuildContext context) {
    return Consumer<Numbers>(
      builder: (BuildContext context, Numbers obj, Widget child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Bingo with family'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    height: 16,
                    width: (obj.progress <= 5) ? obj.progress * (MediaQuery.of(context).size.width / 5) : MediaQuery.of(context).size.width,
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(color: Colors.black, width: 2),
                  color: Colors.pinkAccent,
                ),
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    5,
                    (index) => Text(
                      bingo[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                  ),
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                itemCount: obj.numbers.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                ),
                itemBuilder: (context, i) {
                  return InkWell(
                    onTap: () {
                      obj.cross(i);
                      obj.updateLists(i);
                      print('dLeft: ${obj.dLeft}');
                      print('dRight: ${obj.dRight}');
//                      print(obj.r1);
//                      print(obj.r2);
//                      print(obj.r3);
//                      print(obj.r4);
//                      print(obj.r5);
//                      print(obj.c1);
//                      print(obj.c2);
//                      print(obj.c3);
//                      print(obj.c4);
//                      print(obj.c5);
                      print('Progress: ${obj.progress}');
                    },
                    child: Container(
                      color: (!obj.isCrossed[i]) ? Colors.blue : Colors.red,
                      child: Center(
                        child: Text(
                          '${obj.numbers[i]}',
                          style: TextStyle(
                            fontSize: 40,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              obj.shuffle();
            },
            tooltip: 'Restart match',
            elevation: 20,
            focusColor: Colors.black,
            backgroundColor: Colors.pink,
            splashColor: Colors.green,
            hoverColor: Colors.yellow,
            child: Icon(Icons.scatter_plot),
          ),
        );
      },
    );
  }
}
