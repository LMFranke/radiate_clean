import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readiate_clean/storage/storage_settings.dart';

import '../components/util/snack_bar_info.dart';
import '../controller/theme_controller.dart';
import '../database/database.dart';
import '../provider/database_provider.dart';
import '../translate/strings.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  int _languageValue = 0;
  bool _isLoginEnabled = false;
  bool _isPasswordVisible = false;
  
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    _isLoginEnabled = StorageSettings.isLoginEnabled;

    switch (StorageSettings.language) {
      case "en-US":
        _languageValue = 1;
        break;
      default:
        _languageValue = 0;
    }

    final db = DatabaseProvider.of(context);
    final users = await db.fetchUser();

    if (users.isNotEmpty) {
      _loginController.text = users.first.email;
      _passwordController.text = users.first.password;
    } else {
      final storageData = await StorageSettings().getUser();
      if (storageData[0] != null) _loginController.text = storageData[0]!;
      if (storageData[1] != null) _passwordController.text = storageData[1]!;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    final isDark = Theme.of(context).brightness == Brightness.dark;
    final themeController = context.watch<ThemeController>();
    String currentTheme = "system";

    if (themeController.themeMode == ThemeMode.light) {
      currentTheme = "light";
    }

    if (themeController.themeMode == ThemeMode.dark) {
      currentTheme = "dark";
    }

    final containerColor = isDark ? Colors.grey[850] : Colors.grey[100];
    final borderColor = isDark ? Colors.grey[700]! : Colors.grey[300]!;
    final inputFillColor = isDark ? Colors.grey[700] : Colors.white;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(Translate.getString(Texts.settings_title)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                Translate.getString(Texts.general),
                style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
              ),
            ),
            SwitchListTile(
              title: Text(Translate.getString(Texts.enable_login)),
              value: _isLoginEnabled,
              onChanged: (bool value) {
                setState(() {
                  _isLoginEnabled = value;
                });
                StorageSettings().saveLoginEnabled(value);
              },
            ),
            Visibility(
              visible: _isLoginEnabled,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: borderColor),
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _loginController,
                        decoration: InputDecoration(
                          labelText: Translate.getString(Texts.login),
                          prefixIcon: const Icon(Icons.person),
                          border: const OutlineInputBorder(),
                          filled: true,
                          fillColor: inputFillColor,
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: !_isPasswordVisible,
                        decoration: InputDecoration(
                          labelText: Translate.getString(Texts.password),
                          prefixIcon: const Icon(Icons.lock),
                          border: const OutlineInputBorder(),
                          filled: true,
                          fillColor: inputFillColor,
                          suffixIcon: IconButton(
                            icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: _saveCredentials,
                          child: Text(Translate.getString(Texts.save)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                Translate.getString(Texts.appearance),
                style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
              ),
            ),
            RadioListTile<String>(
              title: Text(Translate.getString(Texts.theme_system)),
              value: "system",
              groupValue: StorageSettings.themeMode,
              onChanged: (value) => themeController.setTheme(value!),
            ),
            RadioListTile<String>(
              title: Text(Translate.getString(Texts.theme_light)),
              value: "light",
              groupValue: StorageSettings.themeMode,
              onChanged: (value) => themeController.setTheme(value!),
            ),
            RadioListTile<String>(
              title: Text(Translate.getString(Texts.theme_dark)),
              value: "dark",
              groupValue: StorageSettings.themeMode,
              onChanged: (value) => themeController.setTheme(value!),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                Translate.getString(Texts.switch_language_title),
                style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
              ),
            ),
            RadioListTile(
              title: Text(Translate.getString(Texts.brazilian_portuguese)),
              value: 0,
              groupValue: _languageValue,
              onChanged: _onLanguageChanged,
            ),
            RadioListTile(
              title: Text(Translate.getString(Texts.english)),
              value: 1,
              groupValue: _languageValue,
              onChanged: _onLanguageChanged,
            ),
          ],
        ),
      ),
    );
  }

  void _saveCredentials() async {
    final login = _loginController.text.trim();
    final password = _passwordController.text.trim();

    if (login.isEmpty || password.isEmpty) {
      SnackBarInfo(
        text: Translate.getString(Texts.invalid_input_is_empty),
        context: context,
        textColor: Colors.white,
        backgroundColor: Colors.red,
      );
      return;
    }

    final db = DatabaseProvider.of(context);

    await StorageSettings().saveUser(login, password);

    final users = await db.fetchUser();

    if (users.isEmpty) {
      await db.insertUser(
        UserTableCompanion(
          name: const Value("Admin"),
          email: Value(login),
          password: Value(password),
          notificationDateTime: Value(DateTime.now()),
        ),
      );
    } else {
      final adminUser = users.first;
      await (db.update(db.userTable)..where((tbl) => tbl.id.equals(adminUser.id))).write(
        UserTableCompanion(
          email: Value(login),
          password: Value(password),
        ),
      );
    }

    if (mounted) {
      SnackBarInfo(
        text: Translate.getString(Texts.success_add_login),
        context: context,
        textColor: Colors.white,
        backgroundColor: Colors.green,
      );
      FocusScope.of(context).unfocus();
    }
  }

  void _onLanguageChanged(int? value) {
    if (value == null) return;

    setState(() {
      _languageValue = value;
    });

    String langCode = (value == 1) ? "en-US" : "pt-BR";
    StorageSettings().saveLanguage(langCode).then((_) {
      setState(() {});
    });
  }

}
