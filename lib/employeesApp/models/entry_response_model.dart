class EntryResponseModel {
  String status;
  Data data;

  EntryResponseModel({this.status, this.data});

  EntryResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String name;
  String salary;
  String age;
  int id;

  Data({this.name, this.salary, this.age, this.id});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    salary = json['salary'];
    age = json['age'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['salary'] = this.salary;
    data['age'] = this.age;
    data['id'] = this.id;
    return data;
  }
}
