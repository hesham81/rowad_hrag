import 'package:rowad_hrag/features/auth/domain/entities/cities.dart';

class CityDataModel extends City {
  const CityDataModel({
    required super.id,
    required super.countryId,
    required super.name,
  });

  factory CityDataModel.fromJson(Map<String, dynamic> json) =>
      CityDataModel(
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
