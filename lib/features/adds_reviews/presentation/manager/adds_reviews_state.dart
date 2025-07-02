part of 'adds_reviews_cubit.dart';

abstract class AddsReviewsState {}

class AddsReviewsInitial extends AddsReviewsState {}

class LoadedAddsReviewsState extends AddsReviewsState {
  final List<AddsReviewsDataModel> addsReviews;

  LoadedAddsReviewsState(this.addsReviews);
}

class ErrorAddsReviewsState extends AddsReviewsState {
  final String message;

  ErrorAddsReviewsState(this.message);
}
