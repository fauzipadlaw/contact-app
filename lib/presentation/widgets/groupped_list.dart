import 'package:contact_app/core/theme/colors.dart';
import 'package:contact_app/presentation/widgets/contact_row.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/contact.dart';

class GrouppedList extends StatelessWidget {
  final List<Contact> contacts;
  const GrouppedList({
    super.key,
    required this.contacts,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'A',
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w700, color: blue),
          ),
          const Divider(
            color: darkGray,
            thickness: 0.5,
          ),
          ...List.generate(
              contacts.length, (index) => ContactRow(contact: contacts[index])),
        ],
      ),
    );
  }
}
