import '../../data/repositories/employees_repo.dart';
import '../models/employee_model.dart';

class SearchEmployee{

  bool isEmpAvailable(int id, List<Employee> employeeList) {
    for (Employee employee in employeeList) {
      if (employee.id == id) {
        return true;
      }
    }
    return false;
  }

  Future<Employee>searchEmployee(int id, List<Employee> employeeList) async {
    bool search = isEmpAvailable(id, employeeList);
    if (search == true) {
      var employee = await EmployeesRepo().getEmployeeDetails(id);
      return employee;
    } else {
      throw 'Employee not in the list';
      // show a snackbar which shows cant find the employee
    }
  }
}
