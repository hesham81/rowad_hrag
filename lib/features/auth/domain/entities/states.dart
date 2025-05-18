import 'package:equatable/equatable.dart';

class States extends Equatable {
  final int id;

  final int stateId;

  final String name;

  const States({
    required this.id,
    required this.stateId,
    required this.name,
  });

  @override
  List<Object?> get props => [name, id];
}
