import 'package:flutter/cupertino.dart';

class DataProvider extends ChangeNotifier {
  int itemCount = 0;

  //call when item is added
  void incrementCount() {
    ++itemCount;
    notifyListeners();
  }

  //call when item is removed
  void decrementCount() {
    --itemCount;
    notifyListeners();
  }
}
