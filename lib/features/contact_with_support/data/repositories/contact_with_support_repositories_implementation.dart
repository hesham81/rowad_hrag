import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:rowad_hrag/core/failures/failure.dart';
import 'package:rowad_hrag/core/failures/failures.dart';
import 'package:rowad_hrag/features/contact_with_support/data/data_sources/contact_with_support_interface_data_source.dart';
import 'package:rowad_hrag/features/contact_with_support/data/models/contact_data_model.dart';
import 'package:rowad_hrag/features/contact_with_support/domain/repositories/contact_with_support_repositories.dart';

class ContactWithSupportRepositoriesImplementation
    implements ContactWithSupportRepositories {
  late ContactWithSupportInterfaceDataSource _dataSource;

  ContactWithSupportRepositoriesImplementation(this._dataSource);

  @override
  Future<Either<Failure, List<ContactDataModel>>> getAllContacts() async {
    try {
      var response = await _dataSource.getAllContacts();
      List<ContactDataModel> contacts =
          List.from(response.data["tickets"]['data'])
              .map((e) => ContactDataModel.fromJson(
                    e,
                  ))
              .toList();

      return Right(contacts);
    } catch (error) {
      return Left(
        ServerFailure(
          statusCode: "501",
          message: error.toString(),
        ),
      );
    }
  }
}
