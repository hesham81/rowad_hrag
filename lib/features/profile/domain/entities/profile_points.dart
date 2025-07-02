import 'package:equatable/equatable.dart';

class ProfilePoints extends Equatable {
  final int id;

  final String transactionId;

  final String type;

  final int points;

  final String pointsExpiredAt;

  final String createdAt;

  final String updatedAt;

  final int isExpired;

  const ProfilePoints({
    required this.id,
    required this.transactionId,
    required this.type,
    required this.points,
    required this.pointsExpiredAt,
    required this.createdAt,
    required this.updatedAt,
    required this.isExpired,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        transactionId,
        type,
        points,
        pointsExpiredAt,
        createdAt,
        updatedAt,
        isExpired,
      ];
}
