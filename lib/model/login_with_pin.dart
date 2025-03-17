class LoginWithPinModel {
  final int studentId;
  final String token;

  LoginWithPinModel({required this.studentId, required this.token});

  factory LoginWithPinModel.fromJson(Map<String, dynamic> json) {
    return LoginWithPinModel(
      studentId: json['studentId'],
      token: json['token'],
    );
  }
}