import 'package:rowad_hrag/features/contact_with_support/domain/entities/contact_entity.dart';

class ContactDataModel extends ContactEntity {
  ContactDataModel({
    required super.id,
    required super.subject,
    required super.details,
    required super.code,
    required super.status,
    required super.clientViewed,
    super.files,
  });

  factory ContactDataModel.fromJson(Map<String, dynamic> json) {
    return ContactDataModel(
      id: json['id'],
      subject: json['subject'],
      details: json['details'],
      code: json['code'],
      status: json['status'],
      clientViewed: json['client_viewed'],
      files: json['files'],
    );
  }

  fromJson(Map<String, dynamic> json) {
    return ContactDataModel(
      id: json['id'],
      subject: json['subject'],
      details: json['details'],
      code: json['code'],
      status: json['status'],
      clientViewed: json['client_viewed'],
      files: json['files'],
    );
  }
}
