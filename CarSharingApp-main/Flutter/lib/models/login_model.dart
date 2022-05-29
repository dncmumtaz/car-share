class LoginResponseModel {
  final String address;
  final String error;

  LoginResponseModel({this.address, this.error});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(address: json['address'] != null ? json['address']: '', error: json['error'] != null ? json['error']: '');
  }
}

class LoginRequestModel {
  String email;
  String password;

  LoginRequestModel({
    this.email,
    this.password,
});

  Map<String, dynamic> toJson(){
    Map<String, dynamic> map = {
      'email': email.trim(),
      'password': password.trim(),
    };

    return map;
  }
}