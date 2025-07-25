import 'package:flutter/material.dart';

class ScreenViewProvider with ChangeNotifier {
  bool _gridView = false;

  bool get gridView => _gridView;

  void toggleView() {
    _gridView = !_gridView;
    notifyListeners();
  }
}
