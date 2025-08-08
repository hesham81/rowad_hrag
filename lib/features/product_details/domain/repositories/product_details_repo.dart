import 'package:dartz/dartz.dart';
import 'package:rowad_hrag/core/failures/failure.dart';
import 'package:rowad_hrag/features/auth/data/models/city_data_model.dart';
import 'package:rowad_hrag/features/auth/data/models/states_data_model.dart';
import 'package:rowad_hrag/features/product_details/data/models/message_request_data_model.dart';
import 'package:rowad_hrag/features/product_details/data/models/product_details_data_model.dart';

abstract class ProductDetailsRepo {
  Future<Either<Failure, ProductDetailsDataModel>> getProductDetails(String id);

  Future<Either<Failure, CityDataModel>> getState(int id);

  Future<Either<Failure, List<StatesDataModel>>> getCityById(int id);

  Future<Either<Failure, String>> payToProduct(double amount);

  Future<Either<Failure, String>> sendMessage(MessageRequestDataModel message);
}
