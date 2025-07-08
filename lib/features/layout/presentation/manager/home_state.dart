part of 'home_cubit.dart';

sealed class HomeState {
  const HomeState();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeState && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

class Handling extends HomeState {
  const Handling();
}

class HomeInitial extends Handling {
  const HomeInitial();
}

class HomeLoading extends Handling {
  const HomeLoading();
}

class HomeLoaded extends Handling {
  final List<Category> categories;

  HomeLoaded(this.categories);
}

class HomeError extends Handling {
  final String message;

  HomeError(this.message);
}

class LoadingBanners extends Handling {
  const LoadingBanners();
}

class LoadedBanners extends Handling {
  final List<BannerEntity> banners;

  LoadedBanners(this.banners);
}

class ErrorBanners extends Handling {
  final String message;

  ErrorBanners(this.message);
}

class LoadedReviews extends Handling {
  final List<Reviews> reviews;

  const LoadedReviews(this.reviews);
}

class ErrorReviews extends Handling {
  final String message;

  ErrorReviews(this.message);
}

class LoadedSubCategories extends Handling {
  final List<SubCategoriesDataModel> subCategories;

  const LoadedSubCategories(this.subCategories);
}

class ErrorSubCategories extends Handling {
  final String message;

  ErrorSubCategories(this.message);
}

class LoadedSpecialProducts extends Handling {
  final List<ProductsDataModel> specialProducts;

  const LoadedSpecialProducts(this.specialProducts);
}

class ErrorSpecialProducts extends Handling {
  final String message;

  ErrorSpecialProducts(this.message);
}

class UpdateRate extends Handling {
  final int rate;

  UpdateRate({required this.rate});
}

class LoadedProducts extends Handling {}

class LoadedHomeScreen extends Handling {
  final List<CategoryDataModel> categories;
  final List<BannerDataModel> banner;

  final List<BannerDataModel> secondBanner;

  final List<ProductsDataModel> specialProducts;

  final List<ProductsDataModel> productiveFamiliesProducts;

  final List<ProductsDataModel> specialNeedsProducts;

  final List<ProductsDataModel> allProducts;

  final List<ReviewsDataModel> reviews;

  final VisitorStatesDataModel visitorStatesDataModel;

  final List<TopSellersDataModel> topSellers;

  const LoadedHomeScreen({
    required this.categories,
    required this.banner,
    required this.secondBanner,
    required this.specialProducts,
    required this.productiveFamiliesProducts,
    required this.specialNeedsProducts,
    required this.allProducts,
    required this.reviews,
    required this.visitorStatesDataModel,
    required this.topSellers,
  });
}
