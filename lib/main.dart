import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readiate_clean/database/database.dart';
import 'package:readiate_clean/provider/database_provider.dart';
import 'package:readiate_clean/storage/storage_settings.dart';
import 'package:readiate_clean/view/login_screen.dart';

import 'components/main_navigation_bottom.dart';
import 'controller/clients_controller.dart';
import 'controller/event_controller.dart';
import 'controller/login_controller.dart';
import 'controller/report_controller.dart';
import 'controller/services_controller.dart';

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
    final db = DatabaseProvider.of(context);

    return MultiProvider(
      providers: [

        ChangeNotifierProvider(
          create: (context) => ClientsController(db),
        ),
        ChangeNotifierProvider(
          create: (context) => ServicesController(db),
        ),
        ChangeNotifierProvider(
          create: (context) => EventController(db),
        ),
        ChangeNotifierProvider(
          create: (context) => ReportController(db),
        ),

        Provider(
          create: (context) => LoginController(),
        ),
      ],
      child: MaterialApp(
        title: 'Radiate Clean',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: StorageSettings.rememberLogin ? MainNavigationBottom() : LoginScreen(),
      ),
    );
  }
}
