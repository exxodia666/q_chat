import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:q_chat/features/contacts/models/contact.dart';
import 'package:q_chat/features/contacts/repositories/contacts_repository.dart';
import 'package:q_chat/shared/models/request_statuses.dart';

part 'contacts_event.dart';
part 'contacts_state.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  final ContactsRepository _contactsRepository;
  ContactsBloc({required ContactsRepository contactsRepository})
      : _contactsRepository = contactsRepository,
        super(const ContactsState()) {
    on<GetContacts>(_getContactsHandler);
  }

  Future<void> _getContactsHandler(
    GetContacts event,
    Emitter<ContactsState> emit,
  ) async {
    await _contactsRepository.getContacts();
  }
}
