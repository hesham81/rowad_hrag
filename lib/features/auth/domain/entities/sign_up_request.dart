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
}
