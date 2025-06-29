import 'package:equatable/equatable.dart';

class AddRateRequest extends Equatable {
  final String comment;
  final double rate;

  const AddRateRequest({
    required this.comment,
    required this.rate,
  });

  @override
  List<Object?> get props => [
        comment,
        rate,
      ];
}
