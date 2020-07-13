import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login_api_project/employeesApp/models/employee_entry_model.dart';
import 'package:login_api_project/employeesApp/models/entry_response_model.dart';

class EmployeeClient {
  EmployeeClient._();
  static final EmployeeClient employeeClient = EmployeeClient._();
  http.Client client;
  String baseUrl = 'http://dummy.restapiexample.com/api/v1';
  http.Client initClient() {
    if (client == null) {
      client = http.Client();
      return client;
    } else {
      return client;
    }
  }

  Future<Map<String, dynamic>> getAllEmployees() async {
    try {
      client = initClient();
      http.Response response = await client.get('$baseUrl/employees');
      String stringResponse = response.body;
      Map<String, dynamic> responseMap = json.decode(stringResponse) as Map;
      return responseMap;
    } catch (error) {
      print(error);
    }
  }

  Future<Map> insertNewEmployee(EmployeeEntry employeeEntry) async {
    try {
      client = initClient();

      http.Response response = await client.post('$baseUrl/create',
          body: json.encode(employeeEntry.toJson()));
          Map map = json.decode(response.body) as Map;
          EntryResponseModel entryResponseModel = EntryResponseModel.fromJson(map);
      return ();
    } catch (error) {
      print(error);
    }
  }
}
