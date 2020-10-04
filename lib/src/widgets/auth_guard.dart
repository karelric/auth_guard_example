import 'package:auth_guard/src/models/user.dart';
import 'package:auth_guard/src/pages/auth_page.dart';
import 'package:auth_guard/src/providers.dart';
import 'package:flutter/material.dart';

class AuthGuard extends StatefulWidget {
  final Widget child;

  AuthGuard({@required this.child});

  @override
  _AuthGuardState createState() => _AuthGuardState();
}

class _AuthGuardState extends State<AuthGuard> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<User>(
      valueListenable: AuthProvider.of(context),
      builder: (context, value, child) {
        return Navigator(
          pages: [
            MaterialPage(child: AuthPage(), fullscreenDialog: true),
            //
            if (value != null)
              MaterialPage(child: widget.child, fullscreenDialog: true),
          ],
          onPopPage: (route, result) => !route.isFirst,
        );
      },
    );
  }
}
