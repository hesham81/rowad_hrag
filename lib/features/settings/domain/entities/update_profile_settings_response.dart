import 'package:equatable/equatable.dart';

class UpdateProfileSettingsResponse extends Equatable {
  final bool result;

  final String message;

  const UpdateProfileSettingsResponse({
    required this.result,
    required this.message,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        result,
        message,
      ];
}
