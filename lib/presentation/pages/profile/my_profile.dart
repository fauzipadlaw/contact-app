import 'package:contact_app/core/theme/colors.dart';
import 'package:contact_app/core/utils/helpers.dart';
import 'package:contact_app/presentation/providers/auth_provider.dart';
import 'package:contact_app/presentation/providers/profile_provider.dart';
import 'package:contact_app/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../contacts/contact_detail.dart';
import '../login.dart';

class MyProfile extends ConsumerWidget {
  const MyProfile({super.key});

  _directToLogin() {}

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(contactNotifierProvider);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: AppBar(
          title: const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              'My Profile',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          centerTitle: false,
          actions: [
            TextButton(
              onPressed: () {
                ref.read(loggedIdNotifier.notifier).logout().then((_) {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const Login()));
                });
              },
              style: const ButtonStyle(
                  textStyle: WidgetStatePropertyAll(
                TextStyle(
                  color: blue,
                  fontWeight: FontWeight.w900,
                  fontSize: 16,
                ),
              )),
              child: const Text(
                'Logout',
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
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
                child: Text(
                  profile != null ? getInitial(profile) : '',
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w200,
                    color: white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                '${profile?.firstName} ${profile?.lastName}',
                style: const TextStyle(fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                '${profile?.email}',
                style: const TextStyle(fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Text(
                '${profile?.dob}',
                style: const TextStyle(fontSize: 15),
              ),
            ),
            CustomButton(
              label: 'Update My Detail',
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ContactDetail()));
              },
            )
          ],
        ),
      ),
    );
  }
}
