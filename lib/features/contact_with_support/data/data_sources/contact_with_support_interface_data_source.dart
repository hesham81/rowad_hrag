import 'package:dio/dio.dart';

abstract class ContactWithSupportInterfaceDataSource {
  Future<Response> getAllContacts();
}