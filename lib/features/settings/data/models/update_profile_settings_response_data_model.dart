import 'package:rowad_hrag/features/settings/domain/entities/update_profile_settings_response.dart';

class UpdateProfileSettingsResponseDataModel
    extends UpdateProfileSettingsResponse {
  const UpdateProfileSettingsResponseDataModel({
    required super.result,
    required super.message,
  });

  factory UpdateProfileSettingsResponseDataModel.fromJson(
      Map<String, dynamic> json) {
    return UpdateProfileSettingsResponseDataModel(
      result: json['result'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() => {
        'result': result,
        'message': message,
      };
}
