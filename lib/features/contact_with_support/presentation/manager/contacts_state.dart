part of 'contacts_cubit.dart';

class ContactsState {}

class ContactsInitial extends ContactsState {}

class ContactsLoaded extends ContactsState {
  final List<ContactDataModel> contacts;

  ContactsLoaded(this.contacts);
}

class ContactsError extends ContactsState {
  final String message;

  ContactsError(this.message);
}

class TicketAddedSuccessfully extends ContactsState {
  final ContactDataModel contact;
  TicketAddedSuccessfully(this.contact);
}
