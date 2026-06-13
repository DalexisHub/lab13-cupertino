import 'package:flutter/cupertino.dart';

import 'pages/login_page.dart';

void main() {
  runApp(const PersonasApp());
}

class PersonasApp extends StatelessWidget {
  const PersonasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'App Personas',
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.activeBlue,
        brightness: Brightness.light,
      ),
      home: LoginPage(),
    );
  }
}
