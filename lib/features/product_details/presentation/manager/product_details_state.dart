part of 'product_details_cubit.dart';

class ProductDetailsState {}

class ProductDetailsInitial extends ProductDetailsState {}

class ProductDetailsLoaded extends ProductDetailsState {
  final ProductDetailsDataModel productDetailsDataModel;

  ProductDetailsLoaded(this.productDetailsDataModel);
}

class ProductDetailsError extends ProductDetailsState {
  final String message;

  ProductDetailsError(this.message);
}
