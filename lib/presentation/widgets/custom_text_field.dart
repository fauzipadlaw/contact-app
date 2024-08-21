import 'package:contact_app/core/theme/colors.dart';
import 'package:contact_app/core/utils/helpers.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool isMandatory;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const CustomTextField({
    super.key,
    required this.label,
    required this.isMandatory,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Text.rich(TextSpan(children: [
            TextSpan(text: label),
            if (isMandatory)
              const WidgetSpan(
                  child: Padding(
                padding: EdgeInsets.only(bottom: 2),
                child: Text(
                  '*',
                  style: TextStyle(color: red),
                ),
              ))
          ])),
        ),
        TextFormField(
          controller: controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: const TextStyle(
            color: black,
            fontWeight: FontWeight.w300,
            fontSize: 14,
          ),
          validator: (text) {
            if (isMandatory) return mandatoryValidator(text);
            if (validator != null) return validator!(text);
            return null;
          },
          decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.person_outlined,
              color: blue,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: blue,
                width: 0.5,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: blue,
                width: 0.5,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
          ),
        )
      ],
    );
  }
}
