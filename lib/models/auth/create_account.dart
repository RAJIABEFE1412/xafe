class CreateAccountRequest {
  String name;
  String email;
  String password;

  CreateAccountRequest({this.name, this.email, this.password});

  CreateAccountRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}