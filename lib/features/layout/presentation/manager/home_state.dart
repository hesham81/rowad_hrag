part of 'home_cubit.dart';



sealed class HomeState {
  const HomeState();
}

/// Initial state before loading
class HomeInitial extends HomeState {}

/// Optional loading state (not required but helpful)
class HomeLoading extends HomeState {}

/// Global error state
class HomeError extends HomeState {
  final String message;
  const HomeError(this.message);
}

/// Final fully-loaded home data
class LoadedHomeScreen extends HomeState {
  final List<CategoryDataModel> categories;
  final List<ProductsDataModel> specialProducts;
  final List<ProductsDataModel> productiveFamiliesProducts;
  final List<ProductsDataModel> specialNeedsProducts;
  final List<ProductsDataModel> allProducts;

  const LoadedHomeScreen({
    required this.categories,
    required this.specialProducts,
    required this.productiveFamiliesProducts,
    required this.specialNeedsProducts,
    required this.allProducts,
  });
}
