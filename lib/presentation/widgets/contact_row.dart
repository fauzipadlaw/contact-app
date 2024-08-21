import 'package:contact_app/core/theme/colors.dart';
import 'package:contact_app/core/utils/helpers.dart';
import 'package:contact_app/presentation/pages/contacts/contact_detail.dart';
import 'package:contact_app/presentation/providers/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/contact.dart';

class ContactRow extends ConsumerWidget {
  final Contact contact;
  const ContactRow({super.key, required this.contact});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mine = ref.watch(contactNotifierProvider);
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ContactDetail(
                  contact: contact,
                )));
      },
      child: Container(
        margin: const EdgeInsets.only(top: 8, bottom: 16),
        height: 47,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 8),
              height: 47,
              width: 47,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: blue,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Text(
                getInitial(contact),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w200,
                  color: white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                getFullName(contact),
                style: const TextStyle(fontSize: 15),
              ),
            ),
            if (mine?.id == contact.id)
              const Text(
                '(you)',
                style: TextStyle(color: gray, fontStyle: FontStyle.italic),
              )
          ],
        ),
      ),
    );
  }
}
