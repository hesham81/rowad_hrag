import 'dart:convert';

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
    List<String>? filesList;

    // Parse the files field if it exists and is a valid JSON string
    if (json['files'] != null && json['files'] is String) {
      try {
        final decoded = jsonDecode(json['files']) as List?;
        if (decoded != null) {
          filesList = decoded.map((item) => item.toString()).toList();
        }
      } catch (e) {
        // Handle case where files string is not valid JSON
        filesList = null;
      }
    }

    return ContactDataModel(
      id: json['id'],
      subject: json['subject'],
      details: json['details'],
      code: json['code'],
      status: json['status'],
      clientViewed: json['client_viewed'],
      files: filesList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'subject': subject,
      'details': details,
      'code': code,
      'status': status,
      'client_viewed': clientViewed,
      'files': files != null ? jsonEncode(files) : null,
    };
  }
}