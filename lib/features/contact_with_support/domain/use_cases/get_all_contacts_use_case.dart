import 'package:dartz/dartz.dart';
import 'package:rowad_hrag/features/contact_with_support/data/models/contact_data_model.dart';

import '../../../../core/failures/failure.dart';
import '../entities/contact_entity.dart';
import '../repositories/contact_with_support_repositories.dart';

class GetAllContactsUseCase {
  late ContactWithSupportRepositories contactWithSupportRepositories;

  GetAllContactsUseCase({required this.contactWithSupportRepositories});

  Future<Either<Failure, List<ContactDataModel>>> call() async {
    return await contactWithSupportRepositories.getAllContacts();
  }
}
