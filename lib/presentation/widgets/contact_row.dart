import 'package:contact_app/core/theme/colors.dart';
import 'package:contact_app/core/utils/helpers.dart';
import 'package:contact_app/presentation/pages/contacts/contact_detail.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/contact.dart';

class ContactRow extends StatelessWidget {
  final Contact contact;
  const ContactRow({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
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
