import 'package:rowad_hrag/features/product_details/domain/entities/pay_to_product.dart';

class PayToProductRequestDataModel extends PayToProductRequest {
  const PayToProductRequestDataModel({
    required super.amount,
  });

  factory PayToProductRequestDataModel.fromJson(Map<String, dynamic> json) {
    return PayToProductRequestDataModel(
      amount: json['amount'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    return data;
  }
}
