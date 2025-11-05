import 'package:flutter/material.dart';
import 'package:readiate_clean/database/database.dart';
import 'package:readiate_clean/provider/database_provider.dart';
import 'package:readiate_clean/storage/storage_settings.dart';
import 'package:readiate_clean/view/login_screen.dart';

void main() {
  final MyDatabase database = MyDatabase();
  StorageSettings().start();
  runApp(
    DatabaseProvider(
      database: database,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Radiate Clean',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
