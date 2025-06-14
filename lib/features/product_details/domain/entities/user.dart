import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;

  final String name;

  final String email;

  final int? stateId;

  final int? cityId;

  final String? avatar;

  final String userType ;

  const User({
    required this.id,
    required this.name,
    required this.email,
    this.stateId,
    this.cityId,
    this.avatar,
    required this.userType
  });

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        stateId,
        cityId,
        avatar,
        userType,
      ];
}
