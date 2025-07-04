import 'package:dio/dio.dart';
import 'package:rowad_hrag/features/contact_with_support/data/models/add_new_ticket_data_model.dart';
import 'package:rowad_hrag/features/contact_with_support/data/models/contact_replay_request_data_model.dart';
import 'package:rowad_hrag/features/contact_with_support/domain/entities/add_new_ticket.dart';

abstract class ContactWithSupportInterfaceDataSource {
  Future<Response> getAllContacts();

  Future<Response> sendContactReplay(
    ContactReplayRequestDataModel contactReplayRequest,
  );

  Future<Response> sendNewTicket(AddNewTicketDataModel ticket,);
}
