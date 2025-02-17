part of 'contacts_bloc.dart';

final class ContactsState extends Equatable {
  const ContactsState({
    this.status = RequestStatuses.idle,
    this.contacts = const [],
  });

  final RequestStatuses status;
  final List<Contact> contacts;

  ContactsState copyWith({
    required RequestStatuses status,
    required List<Contact> contacts,
  }) {
    return ContactsState(
      contacts: contacts,
      status: status,
    );
  }

  @override
  List<Object> get props => [status, contacts];
}
