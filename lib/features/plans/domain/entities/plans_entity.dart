import 'package:equatable/equatable.dart';

class PlansEntity extends Equatable {
  final int id;

  final String title;

  final int numberOfMonths;

  final num price;

  final String description;

  final int orderPlan;

  final String color;

  final int numberOfAds;

  final int numberOfPublishAndBuy;

  PlansEntity({
    required this.id,
    required this.title,
    required this.numberOfMonths,
    required this.price,
    required this.description,
    required this.orderPlan,
    required this.color,
    required this.numberOfAds,
    required this.numberOfPublishAndBuy,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        numberOfMonths,
        price,
        description,
        orderPlan,
        color,
        numberOfAds,
        numberOfPublishAndBuy,
      ];
}
