import 'package:flutter/material.dart';
import 'package:readiate_clean/components/main_navigation_bottom.dart';

import '../controller/login_controller.dart';
import '../provider/database_provider.dart';
import '../translate/strings.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FocusNode focusNodeLogin = FocusNode();
  final FocusNode focusNodePassword = FocusNode();

  final LoginController controller = LoginController();
  final _loginKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _loginKey,
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 200,
                        child: Image.asset(
                          "assets/images/logo.png",
                          errorBuilder: (context, error, stackTrace) {
                            print("IMAGE ERROR!\n" + stackTrace.toString());
                            return const CircularProgressIndicator();
                          },
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          errorText: !controller.isUserAndPasswordValid
                              ? Translate.getString(
                                  Texts.login_password_field_invalid,
                                )
                              : null,
                          label: Text(Translate.getString(Texts.login)),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          suffixIcon: const Icon(Icons.person),
                        ),
                        controller: controller.loginController,
                        focusNode: focusNodeLogin,
                        validator: (value) {
                          if (controller.loginController.text.isEmpty) {
                            return Translate.getString(
                              Texts.invalid_input_is_empty,
                            );
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        textInputAction: TextInputAction.done,
                        controller: controller.passwordController,
                        focusNode: focusNodePassword,
                        obscureText: controller.isPasswordHide,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          errorText: !controller.isUserAndPasswordValid
                              ? Translate.getString(
                                  Texts.login_password_field_invalid,
                                )
                              : null,
                          label: Text(Translate.getString(Texts.password)),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                controller.isPasswordHide =
                                    !controller.isPasswordHide;
                              });
                            },
                            icon: controller.isPasswordHide
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                          ),
                        ),
                        onFieldSubmitted: (value) => _validate(),
                        validator: (value) {
                          if (controller.passwordController.text.isEmpty) {
                            return Translate.getString(
                              Texts.invalid_input_is_empty,
                            );
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: () {
                            _validate();
                          },
                          style: const ButtonStyle(
                            padding: WidgetStatePropertyAll(EdgeInsets.all(12)),
                            elevation: WidgetStatePropertyAll(5),
                            backgroundColor: WidgetStatePropertyAll(Colors.blue),
                          ),
                          child: Text(
                            Translate.getString(Texts.login),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _validate() async {
    if (_loginKey.currentState!.validate()) {
      final db = DatabaseProvider.of(context);

      await controller.authUser(db).then((value) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return MainNavigationBottom();
            },
          ),
        );
      });
      setState(() {});
    }
  }
}
