import '/features/auth/domain/entities/sign_in_response.dart';

class SignInModel extends SignInResponse {
  SignInModel({
    required super.accessToken,
    required super.emailVerified,
    required super.name,
    required super.email,
  });

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
        accessToken: json["access_token"],
        emailVerified: json["user"]["email_verified"],
        name: json["user"]["name"],
        email: json["user"]["email"],
      );
}
