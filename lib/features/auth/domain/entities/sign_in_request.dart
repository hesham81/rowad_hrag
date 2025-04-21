class SignInRequest {
  final String email;

  final String password;

  final String loginBy;

  SignInRequest({
    required this.email,
    required this.password,
    required this.loginBy,
  });

  factory SignInRequest.fromJson(Map<String, dynamic> json) => SignInRequest(
        email: json["email"],
        password: json["password"],
        loginBy: json["login_by"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "login_by": loginBy,
      };
}
