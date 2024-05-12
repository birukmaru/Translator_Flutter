import 'package:flutter/material.dart';

class TextFieldForm extends StatelessWidget {
  const TextFieldForm({
    super.key,
    required this.languageController,
  });

  final TextEditingController languageController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.white,
      autofocus: false,
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
        labelText: "Please enter your text...",
        labelStyle: TextStyle(fontSize: 15, color: Colors.white),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1),
        ),
        errorStyle: TextStyle(color: Colors.red, fontSize: 15),
      ),
      controller: languageController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter text to translate";
        } else {
          return null;
        }
      },
    );
  }
}
