import '../../data/repositories/employees_repo.dart';
import '../models/employee_model.dart';

class RegEmailOrPhone {
  bool isEmailRegistered(String email, List<Employee> employeeList) {
    for (Employee employee in employeeList) {
      if (employee.empEmailId == email) {
        return true;
      }
    }
    return false;
  }

  bool isMobRegistered(String phone, List<Employee> employeeList) {
    for (Employee employee in employeeList) {
      if (employee.empPhoneNumber == phone) {
        return true;
      }
    }
    return false;
  }

  addEmployee(Employee employee, List<Employee> employeeList) async {
    if (employee.empFirstName.isNotEmpty &&
        employee.empLastName.isNotEmpty &&
        employee.empEmailId.isNotEmpty &&
        employee.empPhoneNumber.isNotEmpty) {
      bool email = isEmailRegistered(employee.empEmailId, employeeList);
      bool phone = isMobRegistered(employee.empPhoneNumber, employeeList);
      if (email == false && phone == false) {
        var newEmployee = Employee(
          empFirstName: employee.empFirstName,
          empLastName: employee.empLastName,
          empGender: employee.empGender,
          empDateOfBirth: employee.empDateOfBirth,
          empDateOfJoining: employee.empDateOfJoining,
          empPhoneNumber: employee.empPhoneNumber,
          empEmailId: employee.empEmailId,
          empHomeAddrLine1: employee.empHomeAddrLine1,
          empHomeAddrLine2: employee.empHomeAddrLine2,
          empHomeAddrStreet: employee.empHomeAddrStreet,
          empHomeAddrDistrict: employee.empHomeAddrDistrict,
          empHomeAddrState: employee.empHomeAddrState,
          empHomeAddrCountry: employee.empHomeAddrCountry,
          empHomeAddrPinCode: employee.empHomeAddrPinCode,
        );
       await EmployeesRepo().addEmployee(employee: newEmployee);
        
      } else {
        // Get.snackbar(
        //   'Email or phone is already Registered',
        //   'please fill with another email or phone',
        //   snackPosition: SnackPosition.BOTTOM,
        //   backgroundColor: const Color(0XFF556080),
        //   colorText: const Color(0XFFE6FAFC),
        // );
      }
    } else {
      // Get.snackbar(
      //   'Some fields are missing',
      //   'Please try to fill mandatory details',
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: const Color(0XFF556080),
      //   colorText: const Color(0XFFE6FAFC),
      // );
    }
  }
}
