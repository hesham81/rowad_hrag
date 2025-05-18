import 'package:rowad_hrag/features/auth/domain/entities/sign_up_request.dart';

class SignUpDataModel extends SignUpRequest {
  SignUpDataModel({
    required super.name,
    required super.emailOrPhone,
    required super.sex,
    required super.stateId,
    required super.cityId,
    required super.password,
    required super.confirmPassword,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email_or_phone": emailOrPhone,
      "sex": sex,
      "state_id": stateId,
      "city_id": cityId,
      "password": password,
      "confirm_password": confirmPassword,
    };
  }

  factory SignUpDataModel.fromJson(Map<String, dynamic> json) =>
      SignUpDataModel(
        name: json["name"],
        emailOrPhone: json["email_or_phone"],
        sex: json["sex"],
        stateId: json["state_id"],
        cityId: json["city_id"],
        password: json["password"],
        confirmPassword: json["confirm_password"],
      );
}
