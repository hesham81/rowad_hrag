import 'package:dartz/dartz.dart';
import 'package:rowad_hrag/core/failures/failure.dart';
import 'package:rowad_hrag/features/contact_with_support/data/models/contact_data_model.dart';

abstract class ContactWithSupportRepositories {
  Future<Either<Failure, List<ContactDataModel>>> getAllContacts();
}
