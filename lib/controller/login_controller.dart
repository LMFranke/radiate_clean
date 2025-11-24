import 'package:flutter/material.dart';
import 'package:readiate_clean/storage/storage_settings.dart';

import '../database/database.dart';
import '../provider/database_provider.dart';

class LoginController {

  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isPasswordHide = true;
  bool isUserAndPasswordValid = true;

  LoginController() {
    StorageSettings().getUser().then(
      (loginAndPassword) {

        if (loginAndPassword.isEmpty || loginAndPassword.elementAt(0) == null || loginAndPassword.elementAt(1) == null) {
          return;
        }

        loginController.text = loginAndPassword.elementAt(0)!;
        passwordController.text = loginAndPassword.elementAt(1)!;
      },
    );
  }

  Future authUser(MyDatabase db) async {
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
