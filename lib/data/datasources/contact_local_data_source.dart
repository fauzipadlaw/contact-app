import 'dart:convert';

import 'package:contact_app/data/models/contact_model.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

class ContactLocalDataSource {
  final Box<ContactModel> contactBox;

  ContactLocalDataSource(this.contactBox);

  Future<List<ContactModel>> loadContacts() async {
    List<ContactModel> list = contactBox.values.toList();
    if (list.isEmpty) {
      final String response =
          await rootBundle.loadString('assets/json/data.json');
      final data = await json.decode(response);
      List<ContactModel> listData =
          List<ContactModel>.from(data.map((d) => ContactModel.fromJson(d)));
      contactBox.addAll(listData);
    }
    list = contactBox.values.toList();
    return list;
  }
}
