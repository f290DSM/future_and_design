import 'package:flutter/material.dart';

import 'contacts/presentation/contacts_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: Colors.lightGreen,
        brightness: Brightness.light,
      ),
      home: const ContactsPage(),
    );
  }
}
