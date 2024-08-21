import 'package:contact_app/core/theme/colors.dart';
import 'package:contact_app/presentation/widgets/custom_button.dart';
import 'package:contact_app/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final TextEditingController idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 80),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text: 'Hi There\n',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: blue,
                    ),
                  ),
                  TextSpan(
                    text: 'Please login to see your contact list',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: gray,
                    ),
                  ),
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 14),
              child: CustomTextField(
                label: 'User ID',
                isMandatory: true,
                controller: idController,
              ),
            ),
            const CustomButton(
              label: 'Login',
            ),
          ],
        ),
      ),
    );
  }
}
