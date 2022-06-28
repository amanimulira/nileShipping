import 'package:flutter/material.dart';

class MyInputTheme {
  TextStyle _builtTextStyle(Color color, {double size = 16.0}) {
    return TextStyle(
      color: color,
      fontSize: size,
    );
  }

  OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
        color: color,
        width: 1.0,
      ),
    );
  }

  InputDecorationTheme theme() => InputDecorationTheme(
      contentPadding: const EdgeInsets.all(16),
      //isDense seems to do nothing if you pass padding in
      isDense: true,
      // always put the label at the top
      floatingLabelBehavior: FloatingLabelBehavior.always,
      constraints: const BoxConstraints(maxWidth: 150),

      /// Borders
      enabledBorder: _buildBorder(Colors.grey[600]!),
      errorBorder: _buildBorder(Colors.red),
      focusedErrorBorder: _buildBorder(Colors.red),
      border: _buildBorder(Colors.yellow),
      focusedBorder: _buildBorder(Colors.blue),

      // TextStyles
      suffixStyle: _builtTextStyle(Colors.black),
      counterStyle: _builtTextStyle(Colors.grey, size: 12.0),
      floatingLabelStyle: _builtTextStyle(Colors.black),
      // make error and helper the same size, so that the field
      // does not grow in height when there is an error text
      errorStyle: _builtTextStyle(Colors.red, size: 12.0),
      helperStyle: _builtTextStyle(Colors.black, size: 12.0),
      hintStyle: _builtTextStyle(Colors.grey),
      labelStyle: _builtTextStyle(Colors.black),
      prefixStyle: _builtTextStyle(Colors.black));
}
