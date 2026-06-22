import 'package:flutter/material.dart';

class CalculatorController extends ChangeNotifier {
  double _total = 0;

  double get total => _total;

  void plus() {
    _total = _total + 1;
    notifyListeners();
  }

  void minus() {
    _total--;
    notifyListeners();
  }

  void twoX() {
    _total = _total * 2;
    notifyListeners();
  }

  void dividedWithTwo() {
    _total = _total / 2;
    notifyListeners();
  }
}
