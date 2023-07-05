import '../../data/repositories/employees_repo.dart';
import '../models/employee_model.dart';

class SearchEmployee {
  
  static bool isEmpAvailable(int id, List<Employee> employeeList) {
    for (Employee employee in employeeList) {
      if (employee.id == id) {
        return true;
      }
    }
    return false;
  }

  static Future<Employee> searchEmployee(int id, List<Employee> employeeList) async {
    var employee = await EmployeesRepo().getEmployeeDetails(id);
    return employee;
  }
}
