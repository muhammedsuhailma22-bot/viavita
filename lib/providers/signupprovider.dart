import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pawfect_match/models/signupmodels.dart';

class SignupProvider with ChangeNotifier {
  bool isloading = false;

  Future<bool> registerUser(SignupModel user) async {
    isloading = true;
    notifyListeners();

    try {
      final response = await http.post(
        Uri.parse(
          "https://srishticampus.tech/bloodconnect/viavita_api/customer_reg.php",
        ),
        body: user.toJson(),
      );

      print("STATUS CODE: ${response.statusCode}");
      print("API RESPONSE: ${response.body}");

      final data = jsonDecode(response.body);

      isloading = false;
      notifyListeners();

      if (data["success"] == true) {
        return true;
      } else {
        print("ERROR MESSAGE: ${data["message"]}");
        return false;
      }
    } catch (e) {
      print("SIGNUP ERROR: $e");

      isloading = false;
      notifyListeners();

      return false;
    }
  }
}
