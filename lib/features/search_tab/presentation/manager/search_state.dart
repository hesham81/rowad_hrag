part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

class SearchInitial extends Handler {}

sealed class Handler extends SearchState {}

final class SearchLoading extends Handler {}

final class SuccessSearch extends Handler {
  final List<ProductsDataModel> products;

  SuccessSearch({required this.products});
}

final class SearchError extends Handler {
  final String message;

  SearchError({required this.message});
}
