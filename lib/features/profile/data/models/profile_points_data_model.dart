import 'package:rowad_hrag/features/profile/domain/entities/profile_points.dart';

class ProfilePointsDataModel extends ProfilePoints {
  const ProfilePointsDataModel({
    required super.id,
    required super.transactionId,
    required super.type,
    required super.points,
    required super.pointsExpiredAt,
    required super.createdAt,
    required super.updatedAt,
    required super.isExpired,
  });

  factory ProfilePointsDataModel.fromJson(Map<String, dynamic> json) {
    return ProfilePointsDataModel(
      id: json['id'],
      transactionId: json['transaction_id'],
      type: json['type'],
      points: json['points'],
      pointsExpiredAt: json['points_expired_in'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      isExpired: json['is_expired'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'transaction_id': transactionId,
        'type': type,
        'points': points,
        'points_expired_at': pointsExpiredAt,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'is_expired': isExpired,
      };
}
