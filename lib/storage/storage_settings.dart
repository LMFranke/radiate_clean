import 'package:shared_preferences/shared_preferences.dart';

class StorageSettings {

  static String language = "";
  static String userName = "";
  static bool rememberLogin = false;
  static bool isLoginEnabled = true;
  static String themeMode = "system";

  final String _langPath = "appLanguage";
  final String _userPath = "username";
  final String _passwordPath = "password";
  final String _rememberLogin = "rememberLogin";
  final String _loginEnabledPath = "isLoginEnabled";
  final String _themePath = "themeMode";

  Future<void> start() async {
    language = await getLanguage();
    isLoginEnabled = await getLoginEnabled();
    themeMode = await getThemeMode();
  }

  Future<bool> saveLanguage(String newLanguage) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_langPath, newLanguage);
    if (prefs.getString(_langPath) == newLanguage) {
      language = newLanguage;
      return true;
    }
    return false;
  }

  Future<String> getLanguage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? language = prefs.getString(_langPath);
    return language ?? "pt-BR";
  }

  Future saveUser(String username, String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userPath, username);
    await prefs.setString(_passwordPath, password);
  }

  Future<List<String?>> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String?> user = [
      prefs.getString(_userPath),
      prefs.getString(_passwordPath)
    ];
    return user;
  }

  Future saveRememberLogin(bool remember) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_rememberLogin, remember ? "true" : "false");
  }

  Future<bool> getRememberLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_rememberLogin) == "true";
  }

  Future<bool> saveLoginEnabled(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_loginEnabledPath, value);
    isLoginEnabled = value;
    return true;
  }

  Future<bool> getLoginEnabled() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoginEnabled = prefs.getBool(_loginEnabledPath) ?? true;
    return isLoginEnabled;
  }

  Future<bool> saveThemeMode(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themePath, value);
    themeMode = value;
    return true;
  }

  Future<String> getThemeMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_themePath) ?? "system";
  }

}