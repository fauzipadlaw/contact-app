import 'package:contact_app/domain/entities/contact.dart';
import 'package:hive/hive.dart';

part 'contact_model.g.dart';

@HiveType(typeId: 0)
class ContactModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String firstName;
  @HiveField(2)
  final String lastName;
  @HiveField(3)
  final String? email;
  @HiveField(4)
  final String? dob;
  ContactModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.email,
    this.dob,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        dob: json["dob"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "dob": dob,
      };

  factory ContactModel.fromEntity(Contact contact) => ContactModel(
        id: contact.id,
        firstName: contact.firstName,
        lastName: contact.lastName,
        email: contact.email,
        dob: contact.dob,
      );

  Contact toEntity() => Contact(
        id: id,
        firstName: firstName,
        lastName: lastName,
        email: email,
        dob: dob,
      );
}
