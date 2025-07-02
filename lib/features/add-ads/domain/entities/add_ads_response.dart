import 'package:equatable/equatable.dart';

class AddAdsResponse extends Equatable {
  final int id;

  final String name;

  final String description;

  final double unit_price;

  final int cityId;

  final int stateId;

  AddAdsResponse({
    required this.id,
    required this.name,
    required this.description,
    required this.unit_price,
    required this.cityId,
    required this.stateId,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        description,
        unit_price,
        cityId,
        stateId,
      ];
}
