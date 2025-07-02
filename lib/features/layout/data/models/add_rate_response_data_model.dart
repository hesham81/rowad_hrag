import 'package:rowad_hrag/features/layout/domain/entities/add_rate_response.dart';

class AddRateResponseDataModel extends AddRateResponse {
  const AddRateResponseDataModel({
    required super.id,
    required super.userId,
    required super.rate,
    required super.review,
  });

  factory AddRateResponseDataModel.fromJson(Map<String, dynamic> json) {
    return AddRateResponseDataModel(
      id: json['id'],
      userId: json['user_id'],
      rate: json['rate'],
      review: json['review'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'rate': rate,
        'review': review,
      };
}
