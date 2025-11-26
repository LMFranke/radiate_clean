import 'package:flutter/material.dart';
import 'package:readiate_clean/components/main_navigation_bottom.dart';
import 'package:readiate_clean/storage/storage_settings.dart';
import 'package:readiate_clean/view/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initializeSystem();
  }

  Future<void> _initializeSystem() async {
    await Future.wait([
      Future.delayed(const Duration(seconds: 2)),
    ]);

    if (!mounted) {
      return;
    }

    Widget nextScreen;
    if (StorageSettings.isLoginEnabled) {
      nextScreen = const LoginScreen();
    } else {
      nextScreen = const MainNavigationBottom();
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => nextScreen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Image.asset(
                "assets/images/logo.png",
                width: 200,
              ),
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(
              color: Colors.deepPurple,
            ),
          ],
        ),
      ),
    );
  }
}