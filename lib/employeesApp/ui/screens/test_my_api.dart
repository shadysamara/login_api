import 'package:flutter/material.dart';
import 'package:login_api_project/employeesApp/models/all_employees_query.dart';
import 'package:login_api_project/employeesApp/models/employee_entry_model.dart';
import 'package:login_api_project/employeesApp/repositories/employee_client.dart';
import 'package:login_api_project/employeesApp/repositories/employee_repository.dart';

class TestMyApi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('TEST API'),
      ),
      body: Center(
        child: RaisedButton(onPressed: () async {
          EmployeeClient.employeeClient.insertNewEmployee(
              EmployeeEntry(name: 'wesam', age: "24", salary: "2000"));
        }),
      ),
    );
  }
}
