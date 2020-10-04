import 'package:auth_guard/src/providers.dart';
import 'package:flutter/material.dart';
import 'package:auth_guard/src/constants.dart' as consts;

class AuthPage extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute(builder: (_) => AuthPage());
  }

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Sign In!'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Sign in with ${consts.mockEmail}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            //
            SizedBox(height: 32),
            //
            Builder(
              builder: (context) => RaisedButton(
                child: Text('Sign in'.toUpperCase()),
                onPressed: () => _submit(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _submit(BuildContext context) async {
    try {
      await AuthProvider.of(context).signIn(consts.mockEmail);
    } catch (e) {
      Scaffold.of(context).showSnackBar(
        SnackBar(content: Text('Something went wrong.')),
      );
    }
  }
}
