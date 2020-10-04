import 'package:auth_guard/src/providers.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute(builder: (_) => HomePage());
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final user = AuthProvider.of(context).currentUser;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Welcome!'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'You are signed in as ${user.email}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            //
            SizedBox(height: 24),
            //
            Text(
              'This content is protected by authenticaion.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
            ),
            //
            SizedBox(height: 40),
            //
            Text(
              'Tap MAKE AN ERROR to make unauthorize request.',
              textAlign: TextAlign.center,
            ),
            //
            SizedBox(height: 40),
            //
            Builder(
              builder: (context) => RaisedButton(
                child: Text('Make an error'.toUpperCase()),
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
      await ProductProvider.of(context).fetchById('my-product');
    } catch (e) {
      Scaffold.of(context).showSnackBar(
        SnackBar(content: Text('Something went wrong.')),
      );
    }
  }
}
