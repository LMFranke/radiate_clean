import 'package:flutter/material.dart';
import 'package:readiate_clean/storage/storage_settings.dart';

import '../database/database.dart';
import '../provider/database_provider.dart';

class LoginController {
  late MyDatabase db;

  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isPasswordHide = true;
  bool isUserAndPasswordValid = true;

  LoginController() {
    StorageSettings().getUser().then(
      (loginAndPassword) {
        loginController.text = loginAndPassword.elementAt(0)!;
        passwordController.text = loginAndPassword.elementAt(1)!;
      },
    );
  }

  void init(BuildContext context) {
    db = DatabaseProvider.of(context);
  }

  Future authUser() async {
    await db.fetchUser().then(
      (listUser) {
        if (listUser.isEmpty) {
          isUserAndPasswordValid = false;
        }

        for (UserTableData user in listUser) {
          if (user.email == loginController.text && user.password == passwordController.text) {
            _saveUserOnStorage();
            return;
          }
        }
      },
    ).onError(
      (error, stackTrace) {
        isUserAndPasswordValid = false;
      },
    );
  }

  void _saveUserOnStorage() {
    StorageSettings().saveUser(loginController.text, passwordController.text);
  }
}
