import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nile_shipping/themes/validator.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({Key? key}) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (s) {
        if (s!.isWhiteSpace()) {
          return 'This is a required field';
        }
      },
      obscureText: obscurePassword,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        labelText: "Password field",
        // An empty helperText makes it so the field does
        // not grow in height when an error is displayed
        helperText: "",
        hintText: "Password",
        // suffixIcon is great place to put an icon button
        suffixIcon: IconButton(
          onPressed: (() => setState(() => obscurePassword = !obscurePassword)),
          icon: Icon(
            obscurePassword ? Icons.visibility : Icons.visibility_off,
            color: Colors.black,
          ),
          
        ),
      ),
    );
  }
}
