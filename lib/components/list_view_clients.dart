import 'package:flutter/material.dart';
import 'package:readiate_clean/translate/strings.dart';

import '../controller/clients_controller.dart';
import '../database/database.dart';
import 'list_tile_client.dart';

class ListViewClients extends StatelessWidget {

  const ListViewClients({super.key, required this.clientList});
  final List clientList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: clientList.isNotEmpty
          ? ListView.builder(
              shrinkWrap: true,
              itemCount: clientList.length,
              itemBuilder: (context, index) {
                ClientsTableData indexClient = clientList[index];
                return ListTileClient(client: indexClient,);
              },
            )
          : Center(
              child: Text(
                Translate.getString(Texts.no_data_found_client),
                style: const TextStyle(fontSize: 24),
              ),
            ),
    );
  }
}
