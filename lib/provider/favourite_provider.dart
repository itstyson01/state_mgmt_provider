import 'package:flutter/foundation.dart';

class FavouriteProvider with ChangeNotifier {
  List<int> _selecteditem = [];
  List<int> get selecteditem => _selecteditem;
  void addItems(int value) {
    _selecteditem.add(value);
    notifyListeners();
  }

  void removeItems(int value) {
    _selecteditem.remove(value);
    notifyListeners();
  }
}
