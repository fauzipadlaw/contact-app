import 'package:flutter/material.dart';

import '../../domain/entities/contact.dart';

String getInitial(Contact contact) {
  return "${contact.firstName[0]}${contact.lastName[0]}".toUpperCase();
}

String getFullName(Contact contact) {
  return "${contact.firstName} ${contact.lastName}";
}

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(content),
      ),
    );
}
