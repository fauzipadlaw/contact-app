import 'package:contact_app/core/theme/colors.dart';
import 'package:contact_app/presentation/widgets/contact_row.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/contact.dart';

class GrouppedList extends StatelessWidget {
  final Map<String, List<Contact>> contacts;
  const GrouppedList({
    super.key,
    required this.contacts,
  });

  @override
  Widget build(BuildContext context) {
    List<String> keys = contacts.keys.toList();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(keys.length, (index) {
              return Column(
                children: [
                  Text(
                    keys[index].toUpperCase(),
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w700, color: blue),
                  ),
                  const Divider(
                    color: darkGray,
                    thickness: 0.5,
                  ),
                  ...List.generate(contacts.length,
                      (i) => ContactRow(contact: contacts[keys[index]]![i])),
                ],
              );
            }),
          ),
        )
      ],
    );
  }
}
