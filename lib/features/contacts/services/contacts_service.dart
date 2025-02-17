import 'dart:convert';

import 'package:q_chat/features/contacts/models/contact.dart';
import 'package:q_chat/shared/services/services.dart';

class ContactsService {
  final BaseService _baseService;

  ContactsService({required baseService}) : _baseService = baseService;

  Future<List<Contact>> getContacts() async {
    final res = await _baseService.getData(url: '/api/v1/signin');
    var decodedResponse = Contact.fromJson(jsonDecode(res.body));
    return [decodedResponse];
  }
}
