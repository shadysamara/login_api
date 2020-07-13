class EmployeeEntry {
  String name;
  String salary;
  String age;

  EmployeeEntry({this.name, this.salary, this.age});

  EmployeeEntry.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    salary = json['salary'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['salary'] = this.salary;
    data['age'] = this.age;
    return data;
  }
}
