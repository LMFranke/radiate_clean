import 'package:flutter/material.dart';
import 'package:readiate_clean/components/full_screen_dialog_info_event.dart';
import 'package:readiate_clean/controller/event_controller.dart';
import 'package:readiate_clean/translate/strings.dart';

import '../model/event.dart';

class ListViewSchedules extends StatelessWidget {
  const ListViewSchedules({super.key, required this.eventController});

  final EventController eventController;

  @override
  Widget build(BuildContext context) {
    return eventController.eventListSortedByDate.isNotEmpty
        ? ListView.builder(
            itemCount: eventController.eventListSortedByDate.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              Event eventIndex = eventController.eventListSortedByDate[index];

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(eventIndex.client.name),
                      subtitle: Text(
                        "${eventIndex.serviceScheduled.date.day}/"
                        "${eventIndex.serviceScheduled.date.month}/"
                        "${eventIndex.serviceScheduled.date.year} | "
                        "${eventIndex.serviceScheduled.isHalfDay == 1
                            ? Translate.getString(Texts.all_day)
                            : Translate.getString(Texts.half_day)}",
                      ),
                      shape: const Border(
                        bottom: BorderSide(),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FullScreenDialogInfoEvent(event: eventIndex),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 6,
                    )
                  ],
                ),
              );
            },
          )
        : Center(
            child: Text(Translate.getString(Texts.no_data_found_upcoming_event)),
          );
  }
}
