class UserDataModel {
  final String userID, userName, email;

  UserDataModel(
      {required this.userID, required this.userName, required this.email});

  toJson() {
    return {
      "userID": userID,
      "userName": userName,
      "email": email,
    };
  }
}
