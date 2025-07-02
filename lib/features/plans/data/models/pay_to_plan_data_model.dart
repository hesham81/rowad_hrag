import 'package:rowad_hrag/features/plans/domain/entities/pay_to_plan.dart';

class PayToPlanDataModel extends PayToPlan {
  const PayToPlanDataModel({
    required super.planId,
  });

  factory PayToPlanDataModel.fromJson(Map<String, dynamic> json) {
    return PayToPlanDataModel(
      planId: json['plan_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'plan_id': planId,
    };
  }
}
