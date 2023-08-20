

import 'package:flutter/material.dart';

class FavouriteProvider with ChangeNotifier{
  List<int> _numberOfIndex = [];

  List<int> get numberOfIndex => _numberOfIndex;


  void setIndex(int index){
  _numberOfIndex.add(index);
    notifyListeners();
  }

  void removeIndex(int index){
    _numberOfIndex.remove(index);
    notifyListeners();
  }

}