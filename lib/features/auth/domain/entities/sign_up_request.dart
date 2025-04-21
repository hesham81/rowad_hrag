class SignUpRequest {
  final String name;

  final String emailOrPhone;
  final String sex;

  final String stateId;

  final String cityId;

  final String password;

  final String confirmPassword;

  final String loginBy;

  SignUpRequest({
    required this.name,
    required this.emailOrPhone,
    required this.sex,
    required this.stateId,
    required this.cityId,
    required this.password,
    required this.confirmPassword,
    this.loginBy = "email",
  });

  factory SignUpRequest.fromJson(Map<String, dynamic> json) => SignUpRequest(
        name: json["name"],
        emailOrPhone: json["email_or_phone"],
        sex: json["sex"],
        stateId: json["state_id"],
        cityId: json["city_id"],
        password: json["password"],
        confirmPassword: json["password_confirmation"],
        loginBy: json["register_by"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email_or_phone": emailOrPhone,
        "sex": sex,
        "state_id": stateId,
        "city_id": cityId,
        "password": password,
        "password_confirmation": confirmPassword,
        "register_by": loginBy,
      };
}
