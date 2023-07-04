import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/constants/constant.dart';
import '../../domain/models/employee_model.dart';

class EmployeesRepo {
  var client = http.Client();
  
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

  Future<int> updateDetails(
      {required int? id, required Employee employee}) async {
    final url = Uri.parse('$uri/$id');
    final headers = <String, String>{
      'Content-Type': 'application/json',
    };
    final body = jsonEncode(employee.toJson());

    try {
      final response = await client.put(
        url,
        headers: headers,
        body: body,
      );
      return response.statusCode;
    } catch (e) {
      throw Exception('Failed to update employee');
    }
  }

  Future<int> addEmployee({required Employee employee}) async {
    final url = Uri.parse(uri);
    final headers = <String, String>{
      'Content-Type': 'application/json',
    };
    final body = jsonEncode(employee.toJson());

    try {
      final response = await client.post(
        url,
        headers: headers,
        body: body,
      );
      return response.statusCode;
    } catch (e) {
      throw Exception('Failed to update employee');
    }
  }

  Future<int> deleteEmployee({
    required int? id,
  }) async {
    final url = Uri.parse('$uri/$id');
    try {
      final response = await http.delete(url);
      return response.statusCode;
    } catch (e) {
      throw Exception('failed to delete employee');
    }
  }
}
