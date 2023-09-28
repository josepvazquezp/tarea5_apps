import 'package:flutter/material.dart';

class TipTimeProvider with ChangeNotifier {
  int? _service = null;
  bool _isRounded = false;
  double _tipAmount = 0.0;

  int? get get_service => _service;
  bool get get_isRounder => _isRounded;
  double get get_tipAmount => _tipAmount;

  void setRounded() {
    _isRounded = !_isRounded;
    notifyListeners();
  }

  void setService(int? value) {
    _service = value;
    notifyListeners();
  }

  void calculate(double costOfService) {
    switch (_service) {
      case 0: //15%
        _tipAmount = costOfService * 0.15;
        break;
      case 1: //18%
        _tipAmount = costOfService * 0.18;
        break;
      case 2: //20%
        _tipAmount = costOfService * 0.20;
        break;
    }

    if (_isRounded) {
      roundAmount();
      print(_tipAmount);
    }

    notifyListeners();
  }

  void roundAmount() {
    _tipAmount = _tipAmount.ceil().toDouble();
  }
}
