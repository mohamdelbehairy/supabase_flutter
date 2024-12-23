class UserDataModel {
  final String userID, userName, email;
  final DateTime createdAt;

  UserDataModel(
      {required this.userID,
      required this.userName,
      required this.email,
      required this.createdAt});

  factory UserDataModel.fromjson(json) {
    return UserDataModel(
      userID: json["userID"],
      userName: json["userName"],
      email: json["email"],
      createdAt: DateTime.parse(json["created_at"]),
    );
  }
  toJson() {
    return {
      "userID": userID,
      "userName": userName,
      "email": email,
      "created_at": createdAt.toIso8601String()
    };
  }
}
