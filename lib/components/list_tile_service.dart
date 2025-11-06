import 'package:flutter/material.dart';
import 'package:readiate_clean/components/full_screen_dialog_edit_service.dart';
import 'package:readiate_clean/database/database.dart';

import '../model/enum_pop_menu_options.dart';
import '../translate/strings.dart';

class ListTileService extends StatelessWidget {

  const ListTileService({super.key, required this.service});
  final ServiceTableData service;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(service.description),
          subtitle: Text("${Translate.getString(Texts.all_day)}: R\$${service.allDayValue} \n${Translate.getString(Texts.half_day)} R\$${service.halfDayValue}"),
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
                          return FullScreenDialogEditService(
                            service: service,
                          );
                        },
                      ),
                    );
                  }
                case PopMenuOptions.info:
                  {
                    // pageController.accessCustomerPageOption(customer, context);
                  }
                case PopMenuOptions.remove:
                  {
                    // pageController.onLongPress(context, customer);
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
