import 'package:contact_app/domain/entities/contact.dart';
import 'package:contact_app/presentation/widgets/custom_button.dart';
import 'package:contact_app/presentation/widgets/custom_text_field.dart';
import 'package:contact_app/presentation/widgets/section_title.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/colors.dart';
import '../../../core/utils/helpers.dart';

class ContactDetail extends StatelessWidget {
  final Contact? contact;
  ContactDetail({super.key, this.contact});
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final dobConstroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    firstNameController.text = contact?.firstName ?? '';
    lastNameController.text = contact?.lastName ?? '';
    emailController.text = contact?.email ?? '';
    dobConstroller.text = contact?.dob ?? '';
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: AppBar(
          title: const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              'Contact Detail',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 25),
                  height: 100,
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: blue,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: contact == null
                      ? const SizedBox(
                          height: 55,
                          child: Icon(
                            Icons.person_outlined,
                            color: white,
                            size: 55,
                          ),
                        )
                      : Text(
                          getInitial(contact!),
                          style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w200,
                            color: white,
                          ),
                        ),
                ),
              ),
              const SectionTitle(title: 'Main Information'),
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: CustomTextField(
                  label: 'First Name',
                  isMandatory: true,
                  controller: firstNameController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: CustomTextField(
                  label: 'Last Name',
                  isMandatory: true,
                  controller: lastNameController,
                ),
              ),
              const SectionTitle(
                title: 'Sub Information',
                padding: EdgeInsets.only(top: 12),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: CustomTextField(
                  label: 'Email',
                  isMandatory: false,
                  controller: emailController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: CustomTextField(
                  label: 'Date of Birth',
                  isMandatory: false,
                  controller: dobConstroller,
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              const CustomButton(label: 'Update'),
              if (contact != null)
                const Padding(
                  padding: EdgeInsets.only(top: 27.0),
                  child: CustomButton(
                    label: 'Remove',
                    isDanger: true,
                  ),
                ),
              const SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
