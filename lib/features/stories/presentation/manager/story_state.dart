part of 'story_cubit.dart';

@immutable
sealed class StoryState {}

final class StoryInitial extends StoryState {}

final class StoryLoading extends StoryState {}

final class StoryLoaded extends StoryState {
  final List<StoryDataModel> stories;

  StoryLoaded({required this.stories});
}

final class StoryError extends StoryState {
  final Failure failure;

  StoryError({required this.failure});
}

sealed class UploaderHandler extends StoryState {}

final class UploaderHandlerLoading extends UploaderHandler {}

final class UploaderHandlerLoaded extends UploaderHandler {
  final String message;

  UploaderHandlerLoaded({required this.message});
}

final class UploaderHandlerError extends UploaderHandler {
  final Failure failure;

  UploaderHandlerError({required this.failure});
}

