import 'package:contact_app/domain/entities/contact.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecases/get_contact.dart';
import 'my_contacts_provider.dart';

final findContactProvider = Provider<GetContact>((ref) {
  final repository = ref.read(contactRepositoryProvider);
  return GetContact(repository);
});

final contactNotifierProvider =
    StateNotifierProvider<MyProfileNotifier, Contact?>((ref) {
  final getContact = ref.read(findContactProvider);

  return MyProfileNotifier(getContact);
});

class MyProfileNotifier extends StateNotifier<Contact?> {
  final GetContact _getContact;

  MyProfileNotifier(
    this._getContact,
  ) : super(null);

  Future<void> loadContact(String id) async {
    state = await _getContact(id);
  }
}
