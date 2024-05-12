import 'package:flutter/material.dart';
import 'package:translator/translator.dart';
import 'package:translator_app/components/custom_elevated_button.dart';
import 'package:translator_app/components/dropdown_buttons.dart';
import 'package:translator_app/components/text_field.dart';

class LanguageTranslatorPage extends StatefulWidget {
  const LanguageTranslatorPage({super.key});

  @override
  State<LanguageTranslatorPage> createState() => _LanguageTranslatorPageState();
}

class _LanguageTranslatorPageState extends State<LanguageTranslatorPage> {
  var languages = [
    "English",
    "Hindi",
    "Arabic",
    "Russia",
    "Chineese",
    "Amharic",
    "Oromofia",
    "Tigrigna",
    "Turkish"
  ];
  var originLanguage = "From";
  var destinationLanguage = "To";
  var output = "";
  TextEditingController languageController = TextEditingController();

  void translate(String src, String dest, String input) async {
    GoogleTranslator translator = new GoogleTranslator();
    var translation = await translator.translate(input, from: src, to: dest);
    setState(() {
      output = translation.text.toString();
    });
    if (src == "--" || dest == "--") {
      setState(() {
        output = "Fail to translate";
      });
    }
  }

  String getLanguageCode(String language) {
    if (language == "English") {
      return "en";
    } else if (language == "Hindi") {
      return "hi";
    } else if (language == "Arabic") {
      return "ar";
    } else if (language == "Russia") {
      return "ru";
    } else if (language == "Chineese") {
      return "zh-cn";
    } else if (language == "Amharic") {
      return "am";
    } else if (language == "Oromofia") {
      return "om";
    } else if (language == "Tigrigna") {
      return "ti";
    } else if (language == "Turkish") {
      return "tr";
    }
    return "--";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff10223d),
      appBar: AppBar(
        title: const Text(
          "Language Translator",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff10223d),
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomDropdownButton(
                    hint: originLanguage,
                    items: languages,
                    value: originLanguage,
                    onChanged: (String? value) {
                      setState(() {
                        originLanguage = value!;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  const Icon(
                    Icons.arrow_right_alt_outlined,
                    color: Colors.white,
                    size: 40,
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  CustomDropdownButton(
                    hint: destinationLanguage,
                    items: languages,
                    onChanged: (String? value) {
                      setState(() {
                        destinationLanguage = value!;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFieldForm(languageController: languageController)),
              Padding(
                  padding: const EdgeInsets.all(8),
                  child: CustomElevatedButton(
                      onPressed: () {
                        translate(
                          getLanguageCode(originLanguage),
                          getLanguageCode(destinationLanguage),
                          languageController.text.toString(),
                        );
                      },
                      text: "Translate")),
              const SizedBox(
                height: 20,
              ),
              Text(
                "\n$output",
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
