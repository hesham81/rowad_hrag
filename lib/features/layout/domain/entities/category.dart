import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final int id;
  final String name;

  final String icon;
  int numberOfChildren;

  Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.numberOfChildren,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
      ];
}
