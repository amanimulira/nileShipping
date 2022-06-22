import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'login_buttons.dart';

class MySquare extends StatelessWidget {
  final String child;

  const MySquare({required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 400,
        color: Colors.deepOrange,
        child: Center(
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LoginButton(
                          name: child,
                        )),
              );
            },
            child: Text(
              child,
              style: const TextStyle(fontSize: 40),
            ),
          ),
        ),
      ),
    );
  }
}
