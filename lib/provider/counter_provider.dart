import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  int _count = 0;
  int _count2 = 0;

  int get count => _count;
  int get count2 => _count2;

  void incrementFirst() {
    _count++;
    notifyListeners();
  }

  void incrementSec() {
    _count2++;
    notifyListeners();
  }
}
