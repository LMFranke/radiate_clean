import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readiate_clean/database/database.dart';
import 'package:readiate_clean/provider/database_provider.dart';
import 'package:readiate_clean/storage/storage_settings.dart';
import 'package:readiate_clean/view/splash_screen.dart';

import 'controller/clients_controller.dart';
import 'controller/event_controller.dart';
import 'controller/login_controller.dart';
import 'controller/report_controller.dart';
import 'controller/services_controller.dart';
import 'controller/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final MyDatabase database = MyDatabase();
  await StorageSettings().start();

  runApp(DatabaseProvider(database: database, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final db = DatabaseProvider.of(context);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ClientsController(db)),
        ChangeNotifierProvider(create: (context) => ServicesController(db)),
        ChangeNotifierProvider(create: (context) => EventController(db)),
        ChangeNotifierProvider(create: (context) => ReportController(db)),
        ChangeNotifierProvider(create: (context) => ThemeController()),

        Provider(create: (context) => LoginController()),
      ],
      child: Consumer<ThemeController>(
        builder: (context, themeController, child) {
          return MaterialApp(
            title: 'Radiate Clean',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.deepPurple,
                brightness: Brightness.light,
              ),
              useMaterial3: true,
            ),
            darkTheme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.deepPurple,
                brightness: Brightness.dark,
              ),
              useMaterial3: true,
            ),

            themeMode: themeController.themeMode,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
