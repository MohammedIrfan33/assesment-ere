class User {
  String? token;
  String? fullName;
  String? emailId;
  String? phoneNumber;
  String? password;
  String? deviceType;

  User({
    this.token,
    this.fullName,
    this.emailId,
    this.phoneNumber,
    this.password,
    this.deviceType,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        token: json["token"],
        fullName: json["full_name"],
        emailId: json["email_id"],
        phoneNumber: json["phone_number"],
      );

  Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "email_id": emailId,
        "phone_number": phoneNumber,
        "password" : password,
        "device_type": deviceType
      };
}
