import 'package:flutter/material.dart';

import '../../translate/strings.dart';
import '../../view/setting_screen.dart';
import '../../view/login_screen.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key, required this.title});
  final Texts title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(Translate.getString(title)),
      centerTitle: true,
      actions: [
        PopupMenuButton(
          itemBuilder: (context) {
            return [
              PopupMenuItem<int>(
                value: 0,
                child: Row(
                  children: [
                    const Icon(Icons.settings),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      Translate.getString(Texts.settings_title),
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
                      builder: (context) => const SettingScreen(),
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
