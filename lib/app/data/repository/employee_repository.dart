import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:machine_test/app/api/urls.dart';
import 'package:http/http.dart' as http;
import 'package:machine_test/app/data/model/EmployeeModel.dart';





class EmployeeRepository{

  late final List<dynamic> responseData;

  Future getEmployeeDetails() async {
      http.Response response = await http.get(Uri.parse(Urls.employeeDetail));
      print(response.body);
      if (response.statusCode == 200) {
        responseData = jsonDecode(response.body);
      }
      return responseData;
  }

}