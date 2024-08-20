import 'package:contact_app/data/models/contact.dart';
import 'package:contact_app/utils/colors.dart';
import 'package:contact_app/views/contacts/contact_row.dart';
import 'package:flutter/material.dart';

class GrouppedList extends StatelessWidget {
  final List<Contact> contacts;
  const GrouppedList({
    super.key,
    required this.contacts,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'A',
          style:
              TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: blue),
        ),
        const Divider(
          color: darkGray,
          thickness: 0.5,
        ),
        ...List.generate(
            contacts.length, (index) => ContactRow(contact: contacts[index])),
      ],
    );
  }
}
