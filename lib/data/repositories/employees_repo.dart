import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../domain/models/employee_model.dart';

class EmployeesRepo {
  var client = http.Client();
  var uri = 'http://15.207.222.215:8080/api/employees';

  Future<List<Employee>> getEmployeesDetails() async {
    var url = Uri.parse(uri);
    var response = await client.get(url);
    try {
      if (response.statusCode == 200) {
        var json = response.body;
        return employeeFromJson(json);
      }
    } catch (e) {
      print(e);
    }
    throw Exception('failed to load employee list');
  }

  Future<Employee> getEmployeeDetails(int id) async {
    var url = Uri.parse('$uri/$id');
    var response = await client.get(url);
    try {
      if (response.statusCode == 200) {
        var json = response.body;
        return employeeDetailFromJson(json);
      }
    } catch (e) {
      print(e);
    }
    throw Exception('failed to load employee');
  }

  Future<void> updateDetails(
      {required int? id, required Employee employee}) async {
    final url = Uri.parse('$uri/$id');
    final headers = <String, String>{
      'Content-Type': 'application/json',
    };
    final body = jsonEncode(employee.toJson());
    final response = await client.put(
      url,
      headers: headers,
      body: body,
    );

    try {
      if (response.statusCode == 200) {
        // show a snackbar which shows employee details updated successfully
      }
    } catch (e) {
      throw Exception('Failed to update employee');
    }
  }

  Future<void> addEmployee({required Employee employee}) async {
    print('add employeee here');
    final url = Uri.parse(uri);
    final headers = <String, String>{
      'Content-Type': 'application/json',
    };
    final body = jsonEncode(employee.toJson());
    final response = await client.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.statusCode);

    try {
      if (response.statusCode == 201) {
        // show a snackbar which shows new employee successfully
      }
    } catch (e) {
      throw Exception('Failed to update employee');
    }
  }

  Future<void> deleteEmployee({
    required int? id,
  }) async {
    final url = Uri.parse('$uri/$id');
    try {
      final response = await http.delete(url);
      if (response.statusCode == 200) {
        print('deleted');
      }
    } catch (e) {
      throw Exception('failed to delete employee');
    }
  }
}
