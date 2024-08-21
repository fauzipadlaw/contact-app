import 'package:contact_app/core/theme/colors.dart';
import 'package:contact_app/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../contacts/contact_detail.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
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
              onPressed: () => (),
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
                child: const Text(
                  'SS',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w200,
                    color: white,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: Text(
                'Muhammad Fauzi',
                style: TextStyle(fontSize: 15),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: Text(
                'email@email.com',
                style: TextStyle(fontSize: 15),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Text(
                '11/11/1999',
                style: TextStyle(fontSize: 15),
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
