import 'package:equatable/equatable.dart';

class AddRateResponse extends Equatable {
  final int id;

  final int userId;

  final double rate;

  final String review;

  const AddRateResponse({
    required this.id,
    required this.userId,
    required this.rate,
    required this.review,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        userId,
        rate,
        review,
      ];
}
