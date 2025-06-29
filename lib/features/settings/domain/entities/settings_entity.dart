import 'package:equatable/equatable.dart';

class SettingsEntity extends Equatable {
  final String type;

  final String value;

  SettingsEntity({
    required this.type,
    required this.value,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        type,
        value,
      ];
}
