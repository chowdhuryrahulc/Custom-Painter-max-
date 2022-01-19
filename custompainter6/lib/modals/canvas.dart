import 'package:custompainter6/constants/constants.dart';
import 'package:flutter/material.dart';
// import 'package:paint_redesigned/constants/const.dart';

/// Model class to maintain state of the explorer
enum CanvasBackground { dots, vlines, hlines, grid, none }

class CanvasNotifier extends ChangeNotifier {
  List<Color> _listOfColors = [];

  String _aspectRatio = "1:1";

  Color _color = Colors.white;

  String get aspectRatio => _aspectRatio;

  CanvasBackground _background = CanvasBackground.none;

  CanvasBackground get background => _background;

  set background(CanvasBackground value) {
    _background = value;
    notifyListeners();
  }

  set aspectRatio(String value) {
    _aspectRatio = value;
    notifyListeners();
  }

  Color get color => _color;

  set color(Color value) {
    if (_color == value) return;
    _color = value;
    if (!_listOfColors.contains(value)) {
      _listOfColors.insert(0, value);
    } else {
      _listOfColors.remove(value);
      _listOfColors.insert(0, value);
    }
    if (_listOfColors.length > noOfRecentColors) {
      _listOfColors.removeLast();
    }
    notifyListeners();
  }

  List<Color> get listOfColors => _listOfColors;

  set listOfColors(List<Color> value) {
    _listOfColors = value;
    notifyListeners();
  }
}
