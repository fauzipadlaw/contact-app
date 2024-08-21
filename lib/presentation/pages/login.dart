import 'package:contact_app/core/theme/colors.dart';
import 'package:contact_app/presentation/pages/home.dart';
import 'package:contact_app/presentation/widgets/custom_button.dart';
import 'package:contact_app/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/utils/helpers.dart';
import '../providers/auth_provider.dart';
import '../providers/profile_provider.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  final TextEditingController idController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  _checkResult(notifier) {
    if (notifier == null) {
      showSnackBar(context, 'Wrong ID!');
    } else {
      ref.read(loggedIdNotifier.notifier).saveId(notifier.id);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Home()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 80),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
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
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 14),
                child: CustomTextField(
                  label: 'User ID',
                  isMandatory: true,
                  controller: idController,
                ),
              ),
              CustomButton(
                label: 'Login',
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    ref
                        .read(contactNotifierProvider.notifier)
                        .loadContact(idController.text)
                        .then((_) {
                      final contactNot = ref.read(contactNotifierProvider);
                      _checkResult(contactNot);
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
