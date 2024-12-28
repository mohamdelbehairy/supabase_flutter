class UserDataModel {
  final String userID, userName, email;
  String? userImage;
  final DateTime createdAt;

  UserDataModel(
      {required this.userID,
      required this.userName,
      required this.email,
      this.userImage,
      required this.createdAt});

  factory UserDataModel.fromjson(json) {
    return UserDataModel(
      userID: json["userID"],
      userName: json["userName"],
      email: json["email"],
      userImage: json["userImage"],
      createdAt: DateTime.parse(json["created_at"]),
    );
  }
  toJson() {
    return {
      "userID": userID,
      "userName": userName,
      "email": email,
      "userImage": userImage,
      "created_at": createdAt.toIso8601String()
    };
  }
}
