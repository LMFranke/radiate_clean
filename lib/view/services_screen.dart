import 'package:flutter/material.dart';
import 'package:readiate_clean/components/list_view_services.dart';
import 'package:readiate_clean/controller/services_controller.dart';

import '../translate/strings.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key, required this.servicesController});

  final ServicesController servicesController;

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  void initState() {
    super.initState();
    widget.servicesController.getAllServices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Translate.getString(Texts.service_title)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ListenableBuilder(
              listenable: widget.servicesController,
              builder: (context, child) => ListViewServices(
                serviceList: widget.servicesController.serviceList,
                controller: widget.servicesController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
