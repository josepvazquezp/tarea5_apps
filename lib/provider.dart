import 'package:flutter/material.dart';

class LocalProvider extends ChangeNotifier {
  Map<String, String> _currentObject = {};
  bool _check = false;
  List<Map<String, String>> _listElements = [];
  var nameController = TextEditingController();
  var locationController = TextEditingController();
  var noteController = TextEditingController();

  Map<String, String> get getCurrentObject => _currentObject;
  bool get getCheck => _check;
  List<Map<String, String>> get getList => _listElements;

  void setCheck() {
    _check = !_check;
    notifyListeners();
  }

  void save() {
    var object = {
      "name": nameController.text,
      "location": locationController.text,
      "notes": noteController.text,
      "check": _check ? "Currently in season" : "Not in season"
    };

    _listElements.add(object);

    notifyListeners();
  }

  void detailSave(Map<String, String> object) {
    _currentObject = object;
    notifyListeners();
  }

  void reset() {
    _check = false;
    nameController.text = "";
    locationController.text = "";
    noteController.text = "";
    notifyListeners();
  }
}
