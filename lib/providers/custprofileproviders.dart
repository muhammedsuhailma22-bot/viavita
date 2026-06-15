import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pawfect_match/models/custprofilemodels.dart';

class ProfileProvider extends ChangeNotifier {
  Custprofilemodels? profile;

  Future<void> fetchProfile(int customerId) async {
    final url = Uri.parse(
      "https://srishticampus.tech/bloodconnect/viavita_api/view_profile_customer.php?customer_id=$customerId",
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      if (data["success"] == true) {
        profile = Custprofilemodels.fromJson(data["userDetails"][0]);

        notifyListeners();
      }
    }
  }

  Future<bool> updateProfile({
    required int id,
    required String name,
    required String gender,
    required String phone,
    required String email,
    required String address,
  }) async {
    final url = Uri.parse(
      "https://srishticampus.tech/bloodconnect/viavita_api/edit_profile_customer.php",
    );
    print("PROFILE URL = $url");
    final response = await http.post(
      url,

      body: {
        "customer_id": id.toString(),

        "name": name,

        "gender": gender,

        "phone_number": phone,

        "email_id": email,

        "address": address,
      },
    );

    print("UPDATE STATUS: ${response.statusCode}");
    print("UPDATE RESPONSE: ${response.body}");

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      if (data["success"] == true) {
        profile = Custprofilemodels.fromJson(data["userDetails"][0]);

        notifyListeners();

        return true;
      }
    }

    return false;
  }
}
