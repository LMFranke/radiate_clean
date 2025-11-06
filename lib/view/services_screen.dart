import 'package:flutter/material.dart';
import 'package:readiate_clean/components/list_view_services.dart';

import '../components/appbar_app.dart';
import '../translate/strings.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: Texts.service_title),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const ListViewServices(),
          ],
        ),
      ),
    );
  }
}
