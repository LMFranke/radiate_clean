import 'package:flutter/material.dart';
import 'package:readiate_clean/components/listenable_builder_schedules.dart';
import 'package:readiate_clean/controller/event_controller.dart';

import '../translate/strings.dart';
import 'language_screen.dart';
import 'login_screen.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key, required this.eventController});

  final EventController eventController;

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  void initState() {
    super.initState();
    widget.eventController.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Translate.getString(Texts.home_title)),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem<int>(
                  value: 0,
                  child: Row(
                    children: [
                      const Icon(Icons.language),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        Translate.getString(Texts.language_config),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem<int>(
                  value: 1,
                  child: Row(
                    children: [
                      const Icon(Icons.logout),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        Translate.getString(Texts.logout),
                      ),
                    ],
                  ),
                ),
              ];
            },
            icon: const Icon(Icons.more_vert),
            onSelected: (value) {
              switch (value) {
                case 0:
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LanguageScreen(),
                      ),
                    );
                  }
                case 1:
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  }
              }
            },
          )
        ],
      ),
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
                  widget.eventController.sortListBySelectedDay(selectedDay);
                },
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            ListenableBuilderSchedules(eventController: widget.eventController),
          ],
        ),
      ),
    );
  }
}
