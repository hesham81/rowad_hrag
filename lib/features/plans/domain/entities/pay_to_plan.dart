import 'package:equatable/equatable.dart';

class PayToPlan extends Equatable {
  final int planId;

  const PayToPlan({
    required this.planId,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        planId,
      ];
}
