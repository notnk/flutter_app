import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(
          child: Text('Login page',
            style: TextStyle(
              //fontSize: 20,
              color: Colors.redAccent,
              fontWeight: FontWeight.bold,
              ),
            ),
      ),
    );
  }
}
