import 'package:contact_app/data/models/contact.dart';

String getInitial(Contact contact) {
  return "${contact.firstName[0]}${contact.lastName[0]}".toUpperCase();
}

String getFullName(Contact contact) {
  return "${contact.firstName} ${contact.lastName}";
}
