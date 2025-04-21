import 'package:equatable/equatable.dart';

class States extends Equatable {
  final String id;

  final String countryId;

  final String name;

  const States({
    required this.id,
    required this.countryId,
    required this.name,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        countryId,
        name,
      ];
}
