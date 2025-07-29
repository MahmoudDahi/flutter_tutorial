import 'package:flutter/material.dart';
import 'package:flutter_tutorial/data/constants.dart';
import 'package:flutter_tutorial/data/notifiers.dart';
import 'package:flutter_tutorial/views/pages/home_page.dart';
import 'package:flutter_tutorial/views/pages/profile_page.dart';
import 'package:flutter_tutorial/views/pages/settings_page.dart';
import 'package:flutter_tutorial/views/widgets/navbar_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<Widget> pages = [
  HomePage(),
  ProfilePage(),
];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: selectPageNotifier,
        builder: (context, selectPage, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Flutter App'),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () async {
                    isDarkModeNotifier.value = !isDarkModeNotifier.value;
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setBool(
                        KConstants.themeModeKey, isDarkModeNotifier.value);
                  },
                  icon: ValueListenableBuilder(
                      valueListenable: isDarkModeNotifier,
                      builder: (context, isDark, child) {
                        return Icon(
                          isDark ? Icons.light_mode : Icons.dark_mode,
                        );
                      }),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SettingsPage(
                          title: 'Settings',
                        ),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.settings,
                  ),
                )
              ],
            ),
            body: pages[selectPage],
            bottomNavigationBar: NavbarWidget(),
          );
        });
  }
}
