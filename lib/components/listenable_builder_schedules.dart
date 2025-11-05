import 'package:flutter/material.dart';
import 'package:readiate_clean/controller/event_controller.dart';

import 'list_view_schedules.dart';

class ListenableBuilderSchedules extends StatelessWidget {
  const ListenableBuilderSchedules({super.key, required this.eventController});
  final EventController eventController;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: eventController,
      builder: (context, child) {
        return ListViewSchedules(eventController: eventController);
      },
    );
  }
}
