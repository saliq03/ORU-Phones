class UserModel {
  final String userName;
  final String status;
  final String cookies;

  UserModel({required this.userName, required this.status,required this.cookies});

  // Factory method to create a UserModel from JSON
  factory UserModel.fromJson(Map<String, dynamic> json,String? cookies) {
    return UserModel(
      userName: json['user']['userName'] ?? '',
      status: json['status'] ?? '',
      cookies: cookies??''
    );
  }
}
