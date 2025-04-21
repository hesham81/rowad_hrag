class SignInResponse {
  final String accessToken;

  final bool emailVerified;

  final String name;


  final String email;

  SignInResponse({
    required this.accessToken,
    required this.emailVerified,
    required this.name,
    required this.email,
  });
}
