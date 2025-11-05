import 'package:flutter/material.dart';
import 'package:readiate_clean/storage/storage_settings.dart';

import '../translate/strings.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {

  int _character = 0;

  @override
  void initState() {
    super.initState();
    switch (StorageSettings.language) {
      case "en-US":
        {
          _character = 1;
        }
      default:
        {
          _character = 0;
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(
          Translate.getString(Texts.switch_language_title),
        ),
      ),
      body: Column(
        children: [
          RadioListTile(
            title: Text(
              Translate.getString(Texts.brazilian_portuguese),
            ),
            value: 0,
            groupValue: _character,
            onChanged: (value) {
              _onTap(value!);
            },
          ),
          RadioListTile(
            title: Text(
              Translate.getString(Texts.english),
            ),
            value: 1,
            groupValue: _character,
            onChanged: (value) {
              _onTap(value!);
            },
          ),
        ],
      ),
    );
  }

  void _onTap(int value) {

    setState(() {
      _character = value;
    });

    switch (_character) {
      case 1:
        {
          StorageSettings().saveLanguage("en-US");
        }
      default:
        {
          StorageSettings().saveLanguage("pt-BR");
        }
    }

  }


}
