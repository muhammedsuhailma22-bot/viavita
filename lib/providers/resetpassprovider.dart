import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pawfect_match/models/resetpasmodel.dart';

class ForgotProvider with ChangeNotifier {
  bool isloading = false;

  Future<bool> sendResetLink(ForgotModel user) async {
    isloading = true;
    notifyListeners();

    try {
      final response = await http.post(
        Uri.parse(
          "https://srishticampus.tech/bloodconnect/viavita_api/reset_password.php",
        ),
        body: user.toJson(),
      );

      print("STATUS CODE: ${response.statusCode}");
      print("FORGOT RESPONSE: ${response.body}");

      final data = jsonDecode(response.body);

      isloading = false;
      notifyListeners();

      return data["status"] == "success";
    } catch (e) {
      print("FORGOT ERROR: $e");

      isloading = false;
      notifyListeners();

      return false;
    }
  }
}
