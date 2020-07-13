import 'package:login_api_project/employeesApp/models/all_employees_query.dart';
import 'package:login_api_project/employeesApp/repositories/employee_client.dart';

class EmployeeRepository {
  EmployeeRepository._();
  static final EmployeeRepository employeeRepository = EmployeeRepository._();
  Future<List<EmployeesQuery>> getAllEmployees() async {
    Map<String, dynamic> map =
        await EmployeeClient.employeeClient.getAllEmployees();

    AllEmployeesQuery allEmployeesQuery = AllEmployeesQuery.fromJson(map);
    return allEmployeesQuery.data;
  }
}
