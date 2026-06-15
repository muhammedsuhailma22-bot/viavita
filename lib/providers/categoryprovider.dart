import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/categorymodel.dart';

class CategoryProvider extends ChangeNotifier {
  bool isLoading = false;

  List<CategoryModel> categories = [];

  Future<void> getCategories() async {
    isLoading = true;
    notifyListeners();

    final response = await http.get(
      Uri.parse(
        "https://srishticampus.tech/bloodconnect/viavita_api/view_categories.php",
      ),
    );

    print(response.body);

    final data = jsonDecode(response.body);

    categories = (data["categories"] as List)
        .map((e) => CategoryModel.fromJson(e))
        .toList();

    isLoading = false;
    notifyListeners();
  }
}
