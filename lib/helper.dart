import 'package:flutter/material.dart';

Widget textFormFieldItem(
    TextEditingController controller, double padding, double borderRadius, String labelText, String returnText) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
        contentPadding: EdgeInsets.all(padding), // Padding of 8
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius), // Rounded borders
        ),
        labelText: labelText),
    validator: (String? value) {
      if (value == null || value.isEmpty) {
        return returnText;
      }
      return null;
    },
  );
}
