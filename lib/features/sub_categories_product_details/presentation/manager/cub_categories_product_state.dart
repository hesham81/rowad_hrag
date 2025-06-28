part of  'sub_categories_product_cubit.dart';

abstract class SubCategoriesProductState {}

class SubCategoriesProductInitial extends SubCategoriesProductState {}

class SubCategoriesProductLoading extends SubCategoriesProductState {}

class SubCategoriesProductSuccess extends SubCategoriesProductState {
  final List<SubCategoriesProductsDataModel> subCategoriesProducts;
  SubCategoriesProductSuccess(this.subCategoriesProducts);
}

class SubCategoriesProductError extends SubCategoriesProductState {
  final String error;
  SubCategoriesProductError(this.error);
}