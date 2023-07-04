import 'dart:convert';

List<Employee> employeeFromJson(String str) =>
    List<Employee>.from(json.decode(str).map((x) => Employee.fromJson(x)));

String employeeToJson(List<Employee> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

Employee employeeDetailFromJson(String str) =>
    Employee.fromJson(json.decode(str));

class Employee {
  int? id;
  String empFirstName;
  String empLastName;
  EmpGender empGender;
  String empDateOfBirth;
  String empDateOfJoining;
  String empPhoneNumber;
  String empEmailId;
  String empHomeAddrLine1;
  String empHomeAddrLine2;
  String empHomeAddrStreet;
  String empHomeAddrDistrict;
  String empHomeAddrState;
  String empHomeAddrCountry;
  String empHomeAddrPinCode;

  Employee({
    this.id,
    required this.empFirstName,
    required this.empLastName,
    required this.empGender,
    required this.empDateOfBirth,
    required this.empDateOfJoining,
    required this.empPhoneNumber,
    required this.empEmailId,
    required this.empHomeAddrLine1,
    required this.empHomeAddrLine2,
    required this.empHomeAddrStreet,
    required this.empHomeAddrDistrict,
    required this.empHomeAddrState,
    required this.empHomeAddrCountry,
    required this.empHomeAddrPinCode,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        id: json["id"],
        empFirstName: json["empFirstName"],
        empLastName: json["empLastName"],
        empGender: empGenderValues.map[json["empGender"]]!,
        empDateOfBirth: json["empDateOfBirth"],
        empDateOfJoining: json["empDateOfJoining"],
        empPhoneNumber: json["empPhoneNumber"],
        empEmailId: json["empEmailId"],
        empHomeAddrLine1: json["empHomeAddrLine1"],
        empHomeAddrLine2: json["empHomeAddrLine2"],
        empHomeAddrStreet: json["empHomeAddrStreet"],
        empHomeAddrDistrict: json["empHomeAddrDistrict"],
        empHomeAddrState: json["empHomeAddrState"],
        empHomeAddrCountry: json["empHomeAddrCountry"],
        empHomeAddrPinCode: json["empHomeAddrPinCode"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "empFirstName": empFirstName,
        "empLastName": empLastName,
        "empGender": empGenderValues.reverse[empGender],
        "empDateOfBirth": empDateOfBirth,
        "empDateOfJoining": empDateOfJoining,
        "empPhoneNumber": empPhoneNumber,
        "empEmailId": empEmailId,
        "empHomeAddrLine1": empHomeAddrLine1,
        "empHomeAddrLine2": empHomeAddrLine2,
        "empHomeAddrStreet": empHomeAddrStreet,
        "empHomeAddrDistrict": empHomeAddrDistrict,
        "empHomeAddrState": empHomeAddrState,
        "empHomeAddrCountry": empHomeAddrCountry,
        "empHomeAddrPinCode": empHomeAddrPinCode,
      };
}

enum EmpGender { MALE, FEMALE, OTHER }

final empGenderValues = EnumValues({
  "FEMALE": EmpGender.FEMALE,
  "MALE": EmpGender.MALE,
  "OTHER": EmpGender.OTHER
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
