import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:rowad_hrag/core/constant/api_networks.dart';
import 'package:rowad_hrag/features/contact_with_support/data/data_sources/contact_with_support_interface_data_source.dart';
import 'package:rowad_hrag/features/contact_with_support/data/models/add_new_ticket_data_model.dart';
import 'package:rowad_hrag/features/contact_with_support/data/models/contact_replay_request_data_model.dart';

class ContactWithSupportRemoteDataSource
    implements ContactWithSupportInterfaceDataSource {
  late Dio _dio;

  ContactWithSupportRemoteDataSource(this._dio);

  @override
  Future<Response> getAllContacts() async {
    return await _dio.get(ApiEndPoints.getAllContacts);
  }

  @override
  Future<Response> sendContactReplay(
      ContactReplayRequestDataModel contactReplayRequest) {
    // TODO: implement sendContactReplay
    throw UnimplementedError();
  }

  @override
  Future<Response> sendNewTicket(AddNewTicketDataModel ticket) async {
    final formData = FormData();

    // Add subject and details as regular text fields
    formData.fields.add(MapEntry("subject", ticket.subject));
    formData.fields.add(MapEntry("details", ticket.details));

    // If there are attachments, add them as file fields
    if (ticket.attachments != null && ticket.attachments!.isNotEmpty) {
      for (var file in ticket.attachments!) {
        formData.files.add(
          MapEntry(
            "attachments[]", // Use array-style field name if multiple files allowed
            await MultipartFile.fromFile(file.path, filename: file.path.split("/").last),
          ),
        );
      }
    }

    return await _dio.post(
      ApiEndPoints.addTicket,
      data: formData,
    );
  }
}
