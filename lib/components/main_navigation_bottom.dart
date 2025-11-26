import 'package:flutter/material.dart';
import 'package:readiate_clean/view/calendar_screen.dart';
import 'package:readiate_clean/view/clients_screen.dart';
import 'package:readiate_clean/view/report_screen.dart';
import 'package:readiate_clean/view/services_screen.dart';

import 'dialog/full_screen_dialog_add_client.dart';
import 'dialog/full_screen_dialog_add_event.dart';
import 'dialog/full_screen_dialog_add_service.dart';

class MainNavigationBottom extends StatefulWidget {
  const MainNavigationBottom({super.key});

  @override
  State<MainNavigationBottom> createState() => _MainNavigationBottomState();
}

class _MainNavigationBottomState extends State<MainNavigationBottom> {
  int _currentIndexScreen = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndexScreen);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onBottomNavTapped(int index) {
    setState(() {
      _currentIndexScreen = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screenList = [
      const CalendarScreen(),
      const ReportScreen(),
      const ServicesScreen(),
      const ClientsScreen(),
    ];

    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndexScreen = index;
          });
        },
        children: screenList,
      ),
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
              IconButton(
                onPressed: () => _onBottomNavTapped(0),
                icon: Icon(
                  _currentIndexScreen == 0
                      ? Icons.calendar_today
                      : Icons.calendar_today_outlined,
                  color: _currentIndexScreen == 0 ? Colors.deepPurpleAccent : null,
                ),
              ),
              IconButton(
                onPressed: () => _onBottomNavTapped(1),
                icon: Icon(
                  _currentIndexScreen == 1
                      ? Icons.access_time_filled
                      : Icons.access_time,
                  color: _currentIndexScreen == 1 ? Colors.deepPurpleAccent : null,
                ),
              ),
              const SizedBox(width: 40),
              IconButton(
                onPressed: () => _onBottomNavTapped(2),
                icon: Icon(
                  _currentIndexScreen == 2
                      ? Icons.notifications
                      : Icons.notifications_none_outlined,
                  color: _currentIndexScreen == 2 ? Colors.deepPurpleAccent : null,
                ),
              ),
              IconButton(
                onPressed: () => _onBottomNavTapped(3),
                icon: Icon(
                  _currentIndexScreen == 3
                      ? Icons.person
                      : Icons.person_2_outlined,
                  color: _currentIndexScreen == 3 ? Colors.deepPurpleAccent : null,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: _currentIndexScreen != 1 ? FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
        elevation: 2,
        child: const Icon(Icons.add),
        onPressed: () {
          switch (_currentIndexScreen) {
            case 0:
              showFullScreenDialogAddEvent(context);
              break;
            case 2:
              showFullScreenDialogAddService(context);
              break;
            case 3:
              showFullScreenDialogAddClient(context);
              break;
          }
        },
      ) : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void showFullScreenDialogAddEvent(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return const FullScreenDialogAddEvent();
        },
      ),
    );
  }

  void showFullScreenDialogAddClient(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return FullScreenDialogAddClient();
        },
      ),
    );
  }

  void showFullScreenDialogAddService(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) {
          return FullScreenDialogAddService();
        },
      ),
    );
  }
}
