import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/addtaskmodel.dart';

class AddTaskProvider extends ChangeNotifier {
  bool isLoading = false;

  Future<bool> addTask(AddTaskModel task) async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await http.post(
        Uri.parse(
          "https://srishticampus.tech/bloodconnect/viavita_api/add_task.php",
        ),

        body: task.toJson(),
      );

      print("ADD TASK STATUS: ${response.statusCode}");
      print("ADD TASK RESPONSE: ${response.body}");

      final data = jsonDecode(response.body);

      isLoading = false;
      notifyListeners();

      return data["success"] == true;
    } catch (e) {
      print("ADD TASK ERROR: $e");

      isLoading = false;
      notifyListeners();

      return false;
    }
  }
}
