part of 'contacts_bloc.dart';

sealed class ContactsEvent extends Equatable {
  const ContactsEvent();

  @override
  List<Object> get props => [];
}

final class GetContacts extends ContactsEvent {
  const GetContacts();

  @override
  List<Object> get props => [];
}
