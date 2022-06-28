import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String name;
  const LoginButton({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          child: TextButton(
            onPressed: () {},
            child: Text(name),
            style: TextButton.styleFrom(primary: Colors.green),
          ),
        ),
      ),
    );
  }
}
