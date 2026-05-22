import 'package:flutter/material.dart';
import 'package:pawfect_match/models/loginmodel.dart';

class LoginProvider with ChangeNotifier {
  bool isloading = false;

  Future<bool> loginuser(Loginmodel user) async {
    isloading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    isloading = false;
    notifyListeners();

    return true;
  }
}
