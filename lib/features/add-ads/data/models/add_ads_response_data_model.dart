import 'package:rowad_hrag/features/add-ads/domain/entities/add_ads_response.dart';

class AddAdsResponseDataModel extends AddAdsResponse {
  AddAdsResponseDataModel({
    required super.id,
    required super.name,
    required super.description,
    required super.unit_price,
    required super.cityId,
    required super.stateId,
  });

  factory AddAdsResponseDataModel.fromJson(Map<String, dynamic> json) {
    return AddAdsResponseDataModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      unit_price: json['unit_price'],
      cityId: json['city_id'],
      stateId: json['state_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'unit_price': unit_price,
      'city_id': cityId,
      'state_id': stateId,
    };
  }
}
