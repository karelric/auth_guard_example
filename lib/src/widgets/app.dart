import 'package:flutter/material.dart';
import 'package:auth_guard/src/theme.dart';
import 'package:auth_guard/src/pages/home_page.dart';
import 'package:auth_guard/src/widgets/auth_guard.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth Guard',
      theme: kTheme,
      home: AuthGuard(
        child: HomePage(),
      ),
    );
  }
}
