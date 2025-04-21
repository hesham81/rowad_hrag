import 'package:rowad_hrag/features/auth/domain/entities/states.dart';

class StatesDataModel extends States {
  const StatesDataModel({
    required super.id,
    required super.countryId,
    required super.name,
  });

  factory StatesDataModel.fromJson(Map<String, dynamic> json) =>
      StatesDataModel(
        id: json["id"],
        countryId: json["country_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "country_id": countryId,
        "name": name,
      };
}
