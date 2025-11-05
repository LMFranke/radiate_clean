import 'package:flutter/material.dart';
import 'package:readiate_clean/components/list_tile_service.dart';
import 'package:readiate_clean/controller/services_controller.dart';
import 'package:readiate_clean/database/database.dart';

import '../translate/strings.dart';

class ListViewServices extends StatelessWidget {

  const ListViewServices({super.key, required this.serviceList, required this.controller});
  final List serviceList;
  final ServicesController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: serviceList.isNotEmpty
          ? ListView.builder(
        shrinkWrap: true,
        itemCount: serviceList.length,
        itemBuilder: (context, index) {
          ServiceTableData indexService = serviceList[index];
          return ListTileService(service: indexService, controller: controller,);
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
