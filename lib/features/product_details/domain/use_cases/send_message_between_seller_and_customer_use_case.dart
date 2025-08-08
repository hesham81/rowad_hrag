import 'package:dartz/dartz.dart';
import 'package:rowad_hrag/features/product_details/domain/repositories/product_details_repo.dart';

import '../../../../core/failures/failure.dart';
import '../../data/models/message_request_data_model.dart';

class SendMessageBetweenSellerAndCustomerUseCase {
  late final ProductDetailsRepo _productDetailsRepo;

  SendMessageBetweenSellerAndCustomerUseCase(this._productDetailsRepo);

  Future<Either<Failure, String>> call(MessageRequestDataModel message) async {
    return await _productDetailsRepo.sendMessage(message);
  }
}
