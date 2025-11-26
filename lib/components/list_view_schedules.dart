import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readiate_clean/components/dialog/full_screen_dialog_info_event.dart';
import 'package:readiate_clean/controller/event_controller.dart';
import 'package:readiate_clean/translate/strings.dart';

import '../model/event.dart';

class ListViewSchedules extends StatelessWidget {
  const ListViewSchedules({super.key});

  @override
  Widget build(BuildContext context) {
    final eventController = context.watch<EventController>();

    return SingleChildScrollView(
      child: eventController.eventListSortedByDate.isNotEmpty
          ? ListView.builder(
              itemCount: eventController.eventListSortedByDate.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                Event eventIndex = eventController.eventListSortedByDate[index];

                return Dismissible(
                  key: ValueKey(eventIndex.serviceScheduled.id),

                  direction: DismissDirection.endToStart,

                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20.0),
                    child: const Icon(Icons.cancel, color: Colors.white),
                  ),

                  confirmDismiss: (direction) async {
                    return await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                            Translate.getString(Texts.cancel_event_title),
                          ),
                          content: Text(
                            Translate.getString(Texts.cancel_event_message),
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: Text(Translate.getString(Texts.cancel)),
                            ),
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: Text(Translate.getString(Texts.confirm)),
                            ),
                          ],
                        );
                      },
                    );
                  },

                  onDismissed: (direction) {
                    context.read<EventController>().cancelEvent(
                      eventIndex.serviceScheduled.id,
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          Translate.getString(Texts.event_canceled),
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.green,
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(eventIndex.client.name),
                          subtitle: Text(
                            "${eventIndex.serviceScheduled.date.day}/"
                            "${eventIndex.serviceScheduled.date.month}/"
                            "${eventIndex.serviceScheduled.date.year} | "
                            "${eventIndex.serviceScheduled.isHalfDay == 1 ? Translate.getString(Texts.all_day) : Translate.getString(Texts.half_day)}",
                          ),
                          shape: const Border(bottom: BorderSide()),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FullScreenDialogInfoEvent(
                                  event: eventIndex,
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 6),
                      ],
                    ),
                  ),
                );
              },
            )
          : Center(
              child: Text(
                Translate.getString(Texts.no_data_found_upcoming_event),
              ),
            ),
    );
  }
}
