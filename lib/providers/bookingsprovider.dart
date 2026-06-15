import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pawfect_match/models/bookingsmodel.dart';

class EstimateProvider extends ChangeNotifier {
  List<EstimateModel> estimates = [];

  bool isLoading = false;

  Future<void> fetchEstimates(int taskId) async {
    isLoading = true;
    notifyListeners();

    final url = Uri.parse(
      "https://srishticampus.tech/bloodconnect/viavita_api/customer_view_pending_estimates.php?task_id=$taskId",
    );

    final response = await http.get(url);

    print(response.body);

    final data = jsonDecode(response.body);

    if (data["success"] == true) {
      estimates = (data["estimates"] as List)
          .map((e) => EstimateModel.fromJson(e))
          .toList();
    } else {
      estimates = [];
    }

    isLoading = false;

    notifyListeners();
  }
}
