import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pawfect_match/models/task.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskModel> tasks = [];

  List<TaskModel> filteredTasks = [];

  bool isLoading = false;

  Future<void> fetchTasks(String url) async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse(url));
      print(" TASK URL CALLING: $url");
      print("TASK STATUS: ${response.statusCode}");
      print("TASK DATA: ${response.body}");

      final data = jsonDecode(response.body);

      if (data["success"] == true && data["tasks"] != null) {
        tasks = (data["tasks"] as List)
            .map((e) => TaskModel.fromJson(e))
            .toList();

        filteredTasks = tasks;
      } else {
        tasks = [];

        filteredTasks = [];
      }
    } catch (e) {
      print("TASK ERROR: $e");

      tasks = [];

      filteredTasks = [];
    }

    isLoading = false;

    notifyListeners();
  }

  // SEARCH TASKS

  void searchTasks(String value) {
    if (value.isEmpty) {
      filteredTasks = tasks;
    } else {
      filteredTasks = tasks.where((task) {
        return task.categoryName.toLowerCase().contains(value.toLowerCase()) ||
            task.description.toLowerCase().contains(value.toLowerCase()) ||
            task.location.toLowerCase().contains(value.toLowerCase());
      }).toList();
    }

    notifyListeners();
  }

  // ALL TASKS

  Future<void> getTasks() async {
    await fetchTasks(
      "https://srishticampus.tech/bloodconnect/viavita_api/view_my_tasks_customer.php?customer_id=1",
    );
  }

  // PENDING TASKS

  Future<void> getPendingTasks() async {
    await fetchTasks(
      "https://srishticampus.tech/bloodconnect/viavita_api/pending_tasks_customer.php?customer_id=1",
    );
  }

  // IN PROGRESS TASKS

  Future<void> getInProgressTasks() async {
    await fetchTasks(
      "https://srishticampus.tech/bloodconnect/viavita_api/view_inprogress_tasks_customer.php?customer_id=1",
    );
  }

  // COMPLETED TASKS

  Future<void> getCompletedTasks() async {
    await fetchTasks(
      "https://srishticampus.tech/bloodconnect/viavita_api/view_completed_tasks_customer.php?customer_id=1",
    );
  }
}
