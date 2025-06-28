import 'package:rowad_hrag/features/auth/domain/entities/states.dart';

class StatesDataModel extends States {
  const StatesDataModel({
    required super.id,
    required super.stateId,
    required super.name,
  });

  factory StatesDataModel.fromJson(Map<String, dynamic> json) =>
      StatesDataModel(
        id: json["id"],
        stateId: json["state_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "state_id": stateId,
        "name": name,
      };
}
