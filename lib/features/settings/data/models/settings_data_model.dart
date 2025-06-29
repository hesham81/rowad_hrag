import 'package:rowad_hrag/features/settings/domain/entities/settings_entity.dart';

class SettingsDataModel extends SettingsEntity {
  SettingsDataModel({
    required super.type,
    required super.value,
  });

  factory SettingsDataModel.fromJson(Map<String, dynamic> json) {
    return SettingsDataModel(
      type: (json['type'] == null) ? "" : json['type'],
      value:
          (json['value'] is List || json['value'] == null) ? "" : json['value'],
    );
  }

  Map<String, dynamic> toJson() => {
        'type': type,
        'value': value,
      };
}
