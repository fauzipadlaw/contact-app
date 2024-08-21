import 'package:contact_app/core/theme/colors.dart';
import 'package:contact_app/domain/entities/contact.dart';
import 'package:contact_app/presentation/providers/my_contacts_provider.dart';
import 'package:contact_app/presentation/widgets/groupped_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/contact_row.dart';

class MyContacts extends ConsumerWidget {
  const MyContacts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String query = ref.watch(querySearchProvider);
    ref.watch(contactListNotifierProvider.notifier).loadContacts(query);
    ref.watch(grouppedContactsNotifierProvider.notifier).loadContacts();
    var list = ref.watch(contactListNotifierProvider);
    Map<String, List<Contact>> groupped =
        ref.watch(grouppedContactsNotifierProvider);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: AppBar(
          title: const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              'My Contacts',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          centerTitle: false,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: ref.read(querySearchProvider.notifier).onChanged,
              decoration: InputDecoration(
                hintText: 'Search your contact list...',
                hintStyle: const TextStyle(color: gray),
                suffixIcon: const Icon(Icons.search),
                suffixIconColor: WidgetStateColor.resolveWith((states) =>
                    states.contains(WidgetState.focused) ? blue : darkGray),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: darkGray),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: blue),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: query != ''
                    ? Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Column(
                          children: List.generate(
                            list.length,
                            (index) => ContactRow(contact: list[index]),
                          ),
                        ),
                      )
                    : GrouppedList(
                        contacts: groupped,
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
