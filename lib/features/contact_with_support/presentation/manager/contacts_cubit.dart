import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:rowad_hrag/core/services/bot_toast.dart';
import 'package:rowad_hrag/core/services/web_services.dart';
import 'package:rowad_hrag/features/contact_with_support/data/data_sources/contact_with_support_interface_data_source.dart';
import 'package:rowad_hrag/features/contact_with_support/data/data_sources/contact_with_support_remote_data_source.dart';
import 'package:rowad_hrag/features/contact_with_support/data/models/add_new_ticket_data_model.dart';
import 'package:rowad_hrag/features/contact_with_support/data/repositories/contact_with_support_repositories_implementation.dart';
import 'package:rowad_hrag/features/contact_with_support/domain/use_cases/add_new_ticket_use_case.dart';
import 'package:rowad_hrag/features/contact_with_support/domain/use_cases/get_all_contacts_use_case.dart';

import '../../data/models/contact_data_model.dart';
import '../../domain/repositories/contact_with_support_repositories.dart';

part 'contacts_state.dart';

class ContactsCubit extends Cubit<ContactsState> {
  ContactsCubit() : super(ContactsInitial());

  late GetAllContactsUseCase _getAllContactsUseCase;

  late ContactWithSupportRepositories _contactWithSupportRepositories;

  late ContactWithSupportInterfaceDataSource _dataSource;

  late WebServices _services;

  Future<void> getAllContacts() async {
    try {
      _services = WebServices();
      EasyLoading.show();
      _dataSource = ContactWithSupportRemoteDataSource(_services.tokenDio);
      _contactWithSupportRepositories =
          ContactWithSupportRepositoriesImplementation(_dataSource);
      _getAllContactsUseCase = GetAllContactsUseCase(
        contactWithSupportRepositories: _contactWithSupportRepositories,
      );
      var response = await _getAllContactsUseCase.call();
      response.fold(
        (error) => emit(
          ContactsError(
            error.messageAr ?? error.messageEn ?? "حدث خطأ ما",
          ),
        ),
        (contacts) => emit(ContactsLoaded(contacts)),
      );
    } catch (error) {
      throw Exception(error);
    } finally {
      EasyLoading.dismiss();
    }
  }

  late AddNewTicketUseCase _addNewTicketUseCase;

  Future<void> addNewTicket(AddNewTicketDataModel ticket) async {
    try {
      EasyLoading.show();
      _services = WebServices();
      _dataSource = ContactWithSupportRemoteDataSource(_services.tokenDio);
      _contactWithSupportRepositories =
          ContactWithSupportRepositoriesImplementation(_dataSource);
      _addNewTicketUseCase =
          AddNewTicketUseCase(_contactWithSupportRepositories);

      var response = await _addNewTicketUseCase.call(ticket);

      response.fold(
        (error) {
          BotToastServices.showErrorMessage(
            error.messageAr ?? error.messageEn ?? "حدث خطأ ما",
          );
        },
        (contactData) {
          BotToastServices.showSuccessMessage("تم إضافة التذكرة بنجاح");
        },
      );
    } catch (error) {
      BotToastServices.showErrorMessage(error.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }
}
