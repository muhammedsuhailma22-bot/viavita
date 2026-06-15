import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pawfect_match/models/loginmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider with ChangeNotifier {
  bool isloading = false;

  Future<bool> loginuser(Loginmodel user) async {
    isloading = true;
    notifyListeners();

    try {
      final response = await http.post(
        Uri.parse(
          "https://srishticampus.tech/bloodconnect/viavita_api/login.php",
        ),
        body: user.toJson(),
      );

      print("STATUS CODE: ${response.statusCode}");
      print("API RESPONSE: ${response.body}");

      final data = jsonDecode(response.body);

      isloading = false;
      notifyListeners();

      if (data["success"] == true) {
        final prefs = await SharedPreferences.getInstance();

        final userData = data["userDetails"][0];

        print("LOGIN USER DETAILS:");
        print(userData);

        await prefs.setString("customer_id", userData["id"].toString());

        await prefs.setString("email", userData["username"].toString());

        await prefs.setString("phone", userData["phone_no"].toString());

        print("SAVED ID: ${prefs.getString("customer_id")}");
        print("SAVED EMAIL: ${prefs.getString("email")}");

        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("LOGIN ERROR: $e");

      isloading = false;
      notifyListeners();

      return false;
    }
  }
}
