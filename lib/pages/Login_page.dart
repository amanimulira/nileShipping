import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nile_shipping/componets/password_field.dart';
import 'package:nile_shipping/pages/products_page.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print("No User found for that email");
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                width: 300,
                child: PasswordField(),
              ),
              const Text("Sign into account"),
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your email',
                ),
                controller: _email,
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your password',
                ),
                controller: _password,
              ),
              SizedBox(
                width: 300,
                child: ElevatedButton(
                    onPressed: () async {
                      User? user = await loginUsingEmailPassword(
                          email: _email.text,
                          password: _password.text,
                          context: context);
                      if (user != null) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => ProductsPage()));
                      }
                    },
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                      backgroundColor: Colors.lime,
                    ),
                    child: const Text(
                      "Sign In with email and password",
                      style: TextStyle(fontSize: 12),
                    )),
              ),
              SizedBox(
                width: 300,
                child: ElevatedButton(
                    onPressed: () {
                      signInWithGoogle();
                    },
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                      backgroundColor: Colors.lime,
                    ),
                    child: const Text(
                      "Sign In with google",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
