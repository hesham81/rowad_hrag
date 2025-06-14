part of 'all_categories_cubit.dart';

class AllCategoriesState {}

class AllCategoriesInitial extends AllCategoriesState {}

class AllCategoriesLoaded extends AllCategoriesState {
  final List<AllTypesDataModel> allCategories;

  AllCategoriesLoaded(this.allCategories);
}

class AllCategoriesError extends AllCategoriesState {
  final String message;

  AllCategoriesError(this.message);
}
