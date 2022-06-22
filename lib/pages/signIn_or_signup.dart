import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nile_shipping/pages/Login_page.dart';

class SignInSignUp extends StatefulWidget {
  const SignInSignUp({Key? key}) : super(key: key);

  @override
  State<SignInSignUp> createState() => _SignInSignUpState();
}

class _SignInSignUpState extends State<SignInSignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        heightFactor: 200,
        child: Column(
          children: [
            Text(
              "\n \n \n sign into account or create new account",
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(_createRoute());
                    
                  },
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                    backgroundColor: Colors.lime,
                  ),
                  child: const Text(
                    "Sign in",
                    style: TextStyle(fontSize: 12),
                  )),
            ),
            const Text(
              "or",
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                    backgroundColor: Colors.grey,
                  ),
                  child: const Text(
                    " Create  Account ",
                    style: TextStyle(fontSize: 12),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const LoginPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
