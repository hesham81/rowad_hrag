import 'package:equatable/equatable.dart';

class PayToProductRequest extends Equatable {
  final double amount;

  const PayToProductRequest({
    required this.amount,
  });

  @override
  List<Object?> get props => [
        amount,
      ];
}
