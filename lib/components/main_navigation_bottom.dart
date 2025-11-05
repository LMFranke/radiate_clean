import 'package:flutter/material.dart';
import 'package:readiate_clean/components/full_screen_dialog_add_client.dart';
import 'package:readiate_clean/components/full_screen_dialog_add_event.dart';
import 'package:readiate_clean/components/full_screen_dialog_add_service.dart';
import 'package:readiate_clean/controller/clients_controller.dart';
import 'package:readiate_clean/controller/event_controller.dart';
import 'package:readiate_clean/controller/services_controller.dart';
import 'package:readiate_clean/view/calendar_screen.dart';
import 'package:readiate_clean/view/clients_screen.dart';
import 'package:readiate_clean/view/report_screen.dart';
import 'package:readiate_clean/view/services_screen.dart';

class MainNavigationBottom extends StatefulWidget {
  const MainNavigationBottom({super.key});

  @override
  State<MainNavigationBottom> createState() => _MainNavigationBottomState();
}

class _MainNavigationBottomState extends State<MainNavigationBottom> {
  int _currentIndexScreen = 0;

  _changeScreen(int index) {
    setState(() {
      _currentIndexScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    ClientsController clientsController = ClientsController(context: context);
    ServicesController servicesController = ServicesController(context: context);
    EventController eventController = EventController(context: context);

    late final List screenList = [
      CalendarScreen(eventController: eventController),
      const ReportScreen(),
      ServicesScreen(servicesController: servicesController),
      ClientsScreen(clientsController: clientsController),
    ];

    return Scaffold(
      body: screenList[_currentIndexScreen],
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 60,
        color: Colors.transparent,
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: const Border(
              top: BorderSide(color: Colors.black, width: 1),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _currentIndexScreen == 0
                  ? IconButton(
                      onPressed: () {
                        _changeScreen(0);
                      },
                      highlightColor: Colors.deepPurpleAccent,
                      icon: const Icon(
                        Icons.calendar_today,
                        color: Colors.blue,
                      ),
                    )
                  : IconButton(
                      onPressed: () {
                        _changeScreen(0);
                      },
                      highlightColor: Colors.deepPurpleAccent,
                      icon: const Icon(Icons.calendar_today),
                    ),
              _currentIndexScreen == 1
                  ? IconButton(
                      onPressed: () {
                        _changeScreen(1);
                      },
                      highlightColor: Colors.deepPurpleAccent,
                      icon: const Icon(
                        Icons.access_time_filled,
                        color: Colors.blue,
                      ),
                    )
                  : IconButton(
                      onPressed: () {
                        _changeScreen(1);
                      },
                      highlightColor: Colors.deepPurpleAccent,
                      icon: const Icon(
                        Icons.access_time,
                      ),
                    ),
              _currentIndexScreen == 2
                  ? IconButton(
                      onPressed: () {
                        _changeScreen(2);
                      },
                      highlightColor: Colors.deepPurpleAccent,
                      icon: const Icon(
                        Icons.notifications,
                        color: Colors.blue,
                      ),
                    )
                  : IconButton(
                      onPressed: () {
                        _changeScreen(2);
                      },
                      highlightColor: Colors.deepPurpleAccent,
                      icon: const Icon(Icons.notifications_none_outlined),
                    ),
              _currentIndexScreen == 3
                  ? IconButton(
                      onPressed: () {
                        _changeScreen(3);
                      },
                      highlightColor: Colors.deepPurpleAccent,
                      icon: const Icon(
                        Icons.person,
                        color: Colors.blue,
                      ),
                    )
                  : IconButton(
                      onPressed: () {
                        _changeScreen(3);
                      },
                      highlightColor: Colors.deepPurpleAccent,
                      icon: const Icon(Icons.person_2_outlined),
                    ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
        elevation: 2,
        child: const Icon(Icons.add),
        onPressed: () {
          switch (_currentIndexScreen) {
            case 0:
              {
                showFullScreenDialogAddEvent(eventController);
                break;
              }
            case 2:
              {
                showFullScreenDialogAddService(servicesController);
                break;
              }
            case 3:
              {
                showFullScreenDialogAddClient(clientsController);
                break;
              }
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void showFullScreenDialogAddEvent(EventController eventController) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return FullScreenDialogAddEvent(eventController: eventController);
        },
      ),
    );
  }

  void showFullScreenDialogAddClient(ClientsController clientsController) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return FullScreenDialogAddClient(controller: clientsController);
        },
      ),
    );
  }

  void showFullScreenDialogAddService(ServicesController servicesController) {
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) {
          return FullScreenDialogAddService(controller: servicesController);
        },
      ),
    );
  }
}
