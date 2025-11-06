import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readiate_clean/components/appbar_app.dart';
import 'package:readiate_clean/components/list_view_schedules.dart';
import 'package:readiate_clean/controller/event_controller.dart';

import '../translate/strings.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  void initState() {
    super.initState();
    context.read<EventController>().init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: Texts.home_title),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  )),
              child: CalendarDatePicker(
                currentDate: DateTime.now(),
                initialDate: DateTime.now(),
                firstDate: DateTime.utc(2020),
                lastDate: DateTime.utc(2030),
                onDateChanged: (selectedDay) {
                  context.read<EventController>().sortListBySelectedDay(selectedDay);
                },
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            ListViewSchedules(),
          ],
        ),
      ),
    );
  }
}
