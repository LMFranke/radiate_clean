import 'package:shared_preferences/shared_preferences.dart';

class StorageSettings {

  static String language = "";
  static String userName = "";
  static bool rememberLogin = false;

  final String _langPath = "appLanguage";
  final String _userPath = "username";
  final String _passwordPath = "password";
  final String _rememberLogin = "rememberLogin";

  void start() async {
    language = await getLanguage();
    rememberLogin = await getRememberLogin();
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

}