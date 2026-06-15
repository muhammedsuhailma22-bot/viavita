import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ReviewProvider extends ChangeNotifier {
  Future<bool> addReview({
    required String taskId,
    required String rating,
    required String review,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(
          "https://srishticampus.tech/bloodconnect/viavita_api/add_review.php",
        ),

        body: {"task_id": taskId, "rating": rating, "review": review},
      );

      print("REVIEW STATUS: ${response.statusCode}");
      print("REVIEW RESPONSE: ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        return data["success"] == true;
      }

      return false;
    } catch (e) {
      print("REVIEW ERROR: $e");

      return false;
    }
  }
}
