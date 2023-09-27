import 'package:flutter/material.dart';

class LocalProvider extends ChangeNotifier {
  String _name = "";
  String _location = "";
  String _notes = "";
  bool _check = false;
  var nameController = TextEditingController();
  var locationController = TextEditingController();
  var noteController = TextEditingController();

  String get getName => _name;
  String get getLocation => _location;
  String get getNotes => _notes;
  bool get getCheck => _check;

  void setCheck() {
    _check = !_check;
    notifyListeners();
  }

  void save() {
    _name = nameController.text;
    _location = locationController.text;
    _notes = noteController.text;
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
