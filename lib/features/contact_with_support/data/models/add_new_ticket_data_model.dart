import 'package:rowad_hrag/features/contact_with_support/domain/entities/add_new_ticket.dart';

class AddNewTicketDataModel extends AddNewTicket {
  AddNewTicketDataModel({
    required super.subject,
    required super.details,
    required super.attachments,
  });

  factory AddNewTicketDataModel.fromJson(Map<String, dynamic> json) {
    return AddNewTicketDataModel(
      subject: json['subject'],
      details: json['details'],
      attachments: json['attachments'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subject': subject,
      'details': details,
      'attachments': attachments,
    };
  }
}
