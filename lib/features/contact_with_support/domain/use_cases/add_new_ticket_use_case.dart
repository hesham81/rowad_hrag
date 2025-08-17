import 'package:dartz/dartz.dart';
import 'package:rowad_hrag/features/contact_with_support/data/models/contact_data_model.dart';

import '../../../../core/failures/failure.dart';
import '../../data/models/add_new_ticket_data_model.dart';
import '../entities/add_new_ticket.dart';
import '../repositories/contact_with_support_repositories.dart';

class AddNewTicketUseCase {
  late final ContactWithSupportRepositories _contactWithSupportRepositories;

  AddNewTicketUseCase(this._contactWithSupportRepositories);

  Future<Either<Failure, bool>> call(
    AddNewTicketDataModel ticket,
  ) async {
    return await _contactWithSupportRepositories.sendNewTicket(
      ticket,
    );
  }
}
