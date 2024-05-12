import 'package:flutter/material.dart';
import 'package:translator_app/language_translator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Language Translator Application",
      debugShowCheckedModeBanner: false,
      home: LanguageTranslatorPage(),
    );
  }
}
