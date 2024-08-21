import 'package:contact_app/core/theme/colors.dart';
import 'package:contact_app/presentation/pages/contacts/my_contacts.dart';
import 'package:contact_app/presentation/pages/login.dart';
import 'package:contact_app/presentation/pages/profile/my_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/auth_provider.dart';
import '../providers/profile_provider.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    MyContacts(),
    MyProfile(),
  ];

  @override
  void initState() {
    ref.read(loggedIdNotifier.notifier).loadId().then((_) {
      final id = ref.read(loggedIdNotifier);
      if (id != null) {
        ref.read(contactNotifierProvider.notifier).loadContact(id).then((_) {
          final contact = ref.read(contactNotifierProvider);
          if (contact == null) _directToLogin();
        });
      } else {
        _directToLogin();
      }
    });

    super.initState();
  }

  _directToLogin() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Login()));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
