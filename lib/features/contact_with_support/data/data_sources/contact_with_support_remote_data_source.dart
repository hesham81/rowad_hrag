import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:rowad_hrag/core/constant/api_networks.dart';
import 'package:rowad_hrag/features/contact_with_support/data/data_sources/contact_with_support_interface_data_source.dart';

class ContactWithSupportRemoteDataSource
    implements ContactWithSupportInterfaceDataSource {
  late Dio _dio;

  ContactWithSupportRemoteDataSource(this._dio);

  @override
  Future<Response> getAllContacts() async {
    return await _dio.get(ApiEndPoints.getAllContacts);
  }
}
