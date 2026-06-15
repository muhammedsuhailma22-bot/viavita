import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pawfect_match/models/edittasksmodel.dart';
 
class EditTaskProvider extends ChangeNotifier {

  bool isLoading = false;


  Future<bool> editTask(EditTaskModel task) async {

    isLoading = true;
    notifyListeners();


    try {

      final response = await http.post(

        Uri.parse(
          "https://srishticampus.tech/bloodconnect/viavita_api/customer_edit_task.php",
        ),

        body: task.toJson(),
      );


      print("EDIT STATUS: ${response.statusCode}");
      print("EDIT RESPONSE: ${response.body}");


      final data = jsonDecode(response.body);


      isLoading = false;
      notifyListeners();


      return data["success"] == true;


    } catch(e){

      print(e);

      isLoading = false;
      notifyListeners();

      return false;
    }
  }
}