import 'dart:async';

import 'package:q_chat/features/contacts/models/contact.dart';
import 'package:q_chat/features/contacts/services/contacts_service.dart';

class ContactsRepository {
  ContactsRepository({required ContactsService contactsService})
      : _contactsService = contactsService;

  final ContactsService _contactsService;

  Future<List<Contact>> getContacts() async {
    final List<Contact> response =
        await _contactsService.getContacts();
    return response;
  }
}
