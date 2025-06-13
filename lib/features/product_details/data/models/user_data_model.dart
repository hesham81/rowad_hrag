import 'package:rowad_hrag/features/product_details/domain/entities/user.dart';

class UserDataModel extends User {
  const UserDataModel({
    required super.id,
    required super.name,
    required super.email,
    super.avatar,
    super.cityId,
    super.stateId,
    required super.userType,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      avatar: json['avatar'],
      cityId: json['city_id'],
      stateId: json['state_id'],
      userType: json['user_type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['avatar'] = avatar;
    data['city_id'] = cityId;
    data['state_id'] = stateId;
    data['user_type'] = userType;
    return data;
  }
}
