import 'package:rowad_hrag/features/plans/domain/entities/plans_entity.dart';

class PlansDataModel extends PlansEntity {
  PlansDataModel({
    required super.id,
    required super.title,
    required super.numberOfMonths,
    required super.price,
    required super.description,
    required super.orderPlan,
    required super.color,
    required super.numberOfAds,
    required super.numberOfPublishAndBuy,
  });

  factory PlansDataModel.fromJson(Map<String, dynamic> json) => PlansDataModel(
        id: json['id'],
        title: json['title'],
        numberOfMonths: json['number_of_months'],
        price: json['price'],
        description: json['description'],
        orderPlan: json['order_plan'],
        color: json['color'],
        numberOfAds: json['number_of_ads'],
        numberOfPublishAndBuy: json['number_of_publish_and_buy'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'number_of_months': numberOfMonths,
        'price': price,
        'description': description,
        'order_plan': orderPlan,
        'color': color,
        'number_of_ads': numberOfAds,
        'number_of_publish_and_buy': numberOfPublishAndBuy,
      };
}
