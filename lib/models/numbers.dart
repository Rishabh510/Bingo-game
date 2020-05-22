import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Numbers extends ChangeNotifier {
  final List numbers = List.generate(25, (int index) => index + 1)..shuffle();
  final List isCrossed = List.generate(25, (int index) => false);
  final List dLeft = [];
  final List dRight = [];
  final List c1 = [];
  final List c2 = [];
  final List c3 = [];
  final List c4 = [];
  final List c5 = [];
  final List r1 = [];
  final List r2 = [];
  final List r3 = [];
  final List r4 = [];
  final List r5 = [];
  int progress = 0;

  void shuffle() {
    numbers.shuffle();
    isCrossed.fillRange(0, 25, false);
    progress = 0;
    dLeft.clear();
    dRight.clear();
    c1.clear();
    c2.clear();
    c3.clear();
    c4.clear();
    c5.clear();
    r1.clear();
    r2.clear();
    r3.clear();
    r4.clear();
    r5.clear();
    notifyListeners();
  }

  void cross(int index) {
    isCrossed[index] = !isCrossed[index];
    notifyListeners();
  }

  void updateLists(int index) {
    if (isCrossed[index]) {
      if (index % 6 == 0) {
        dLeft.add(index);
        if (dLeft.length == 5) progress++;
      }
      if (index % 4 == 0 && index != 24 && index != 0) {
        dRight.add(index);
        if (dRight.length == 5) progress++;
      }
      if (index % 5 == 0) {
        r1.add(index);
        if (r1.length == 5) progress++;
      }
      if (index % 5 == 1) {
        r2.add(index);
        if (r2.length == 5) progress++;
      }
      if (index % 5 == 2) {
        r3.add(index);
        if (r3.length == 5) progress++;
      }
      if (index % 5 == 3) {
        r4.add(index);
        if (r4.length == 5) progress++;
      }
      if (index % 5 == 4) {
        r5.add(index);
        if (r5.length == 5) progress++;
      }
      if (index ~/ 5 == 0) {
        c1.add(index);
        if (c1.length == 5) progress++;
      }
      if (index ~/ 5 == 1) {
        c2.add(index);
        if (c2.length == 5) progress++;
      }
      if (index ~/ 5 == 2) {
        c3.add(index);
        if (c3.length == 5) progress++;
      }
      if (index ~/ 5 == 3) {
        c4.add(index);
        if (c4.length == 5) progress++;
      }
      if (index ~/ 5 == 4) {
        c5.add(index);
        if (c5.length == 5) progress++;
      }
    } else {
      if (index % 6 == 0) {
        if (dLeft.length == 5) progress--;
        dLeft.remove(index);
      }
      if (index % 4 == 0 && index != 24 && index != 0) {
        if (dRight.length == 5) progress--;
        dRight.remove(index);
      }
      if (index % 5 == 0) {
        if (r1.length == 5) progress--;
        r1.remove(index);
      }
      if (index % 5 == 1) {
        if (r2.length == 5) progress--;
        r2.remove(index);
      }
      if (index % 5 == 2) {
        if (r3.length == 5) progress--;
        r3.remove(index);
      }
      if (index % 5 == 3) {
        if (r4.length == 5) progress--;
        r4.remove(index);
      }
      if (index % 5 == 4) {
        if (r5.length == 5) progress--;
        r5.remove(index);
      }
      if (index ~/ 5 == 0) {
        if (c1.length == 5) progress--;
        c1.remove(index);
      }
      if (index ~/ 5 == 1) {
        if (c2.length == 5) progress--;
        c2.remove(index);
      }
      if (index ~/ 5 == 2) {
        if (c3.length == 5) progress--;
        c3.remove(index);
      }
      if (index ~/ 5 == 3) {
        if (c4.length == 5) progress--;
        c4.remove(index);
      }
      if (index ~/ 5 == 4) {
        if (c5.length == 5) progress--;
        c5.remove(index);
      }
    }
  }
}
