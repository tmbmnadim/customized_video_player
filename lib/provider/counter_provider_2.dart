import 'package:flutter/material.dart';

class CounterProvider2 with ChangeNotifier {
  int _count3 = 0;
  int _count4 = 0;

  int get count3 => _count3;
  int get count4 => _count4;

  void incrementFirst() {
    _count3++;
    notifyListeners();
  }

  void incrementSec() {
    _count4++;
    notifyListeners();
  }
}
