class Contact {
  String id;
  String firstName;
  String lastName;
  String? email;
  String? dob;

  Contact({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.email,
    this.dob,
  });
}
