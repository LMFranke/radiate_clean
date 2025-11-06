import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readiate_clean/components/list_tile_service.dart';
import 'package:readiate_clean/database/database.dart';

import '../controller/services_controller.dart';
import '../translate/strings.dart';

class ListViewServices extends StatelessWidget {
  const ListViewServices({super.key});

  @override
  Widget build(BuildContext context) {
    final servicesController = context.watch<ServicesController>();
    servicesController.getAllServices();
    return Expanded(
      child: servicesController.serviceList.isNotEmpty
          ? ListView.builder(
        shrinkWrap: true,
        itemCount: servicesController.serviceList.length,
        itemBuilder: (context, index) {
          ServiceTableData indexService = servicesController.serviceList[index];

          return ListTileService(
            service: indexService,
          );
        },
      )
          : Center(
        child: Text(
          Translate.getString(Texts.no_data_found_service),
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
