import 'package:flutter/material.dart';
import 'package:readiate_clean/components/full_screen_dialog_edit_client.dart';
import 'package:readiate_clean/components/full_screen_dialog_info_client.dart';
import 'package:readiate_clean/controller/clients_controller.dart';
import 'package:readiate_clean/database/database.dart';
import 'package:readiate_clean/translate/strings.dart';

import '../model/enum_pop_menu_options.dart';

class ListTileClient extends StatelessWidget {

  const ListTileClient({super.key, required this.client, required this.controller});
  final ClientsTableData client;
  final ClientsController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(client.name),
          subtitle: Text(client.phoneNumber),
          trailing: PopupMenuButton<PopMenuOptions>(
            itemBuilder: (_) {
              return [
                PopupMenuItem<PopMenuOptions>(
                  value: PopMenuOptions.edit,
                  child: Row(
                    children: [
                      const Icon(Icons.edit),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(Translate.getString(Texts.edit)),
                    ],
                  ),
                ),
                PopupMenuItem<PopMenuOptions>(
                  value: PopMenuOptions.info,
                  child: Row(
                    children: [
                      const Icon(Icons.info_outline),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(Translate.getString(Texts.info)),
                    ],
                  ),
                ),
                PopupMenuItem<PopMenuOptions>(
                  value: PopMenuOptions.remove,
                  child: Row(
                    children: [
                      const Icon(Icons.delete_forever),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(Translate.getString(Texts.delete)),
                    ],
                  ),
                ),
              ];
            },
            icon: const Icon(Icons.more_vert),
            onSelected: (value) {
              switch (value) {
                case PopMenuOptions.edit:
                  {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (context) {
                          return FullScreenDialogEditClient(
                            controller: controller,
                            client: client,
                          );
                        },
                      ),
                    );
                  }
                case PopMenuOptions.info:
                  {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (context) {
                          return FullScreenDialogInfoClient(
                            client: client,
                          );
                        },
                      ),
                    );
                  }
                case PopMenuOptions.remove:
                  {
                    // controller.removeClient(client);
                    controller.deleteClient(client.id);
                  }
                default:
                  {}
              }
            },
          ),
          shape: const Border(
            bottom: BorderSide(),
          ),
        ),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }
}
