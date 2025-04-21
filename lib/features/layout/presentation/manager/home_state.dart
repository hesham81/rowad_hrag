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
