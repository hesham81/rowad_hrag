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
class UpdateRate extends Handling{
  final int rate;

  UpdateRate({required this.rate});
}
