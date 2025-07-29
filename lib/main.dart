import 'package:flutter/material.dart';
import 'package:flutter_tutorial/data/constants.dart';
import 'package:flutter_tutorial/data/notifiers.dart';
import 'package:flutter_tutorial/views/pages/welcome_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    initThemeMode();
    super.initState();
  }

  Future<void> initThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool(KConstants.themeModeKey) ?? false;
    isDarkModeNotifier.value = isDarkMode;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: isDarkModeNotifier,
        builder: (context, isDark, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.cyan,
                brightness: isDark ? Brightness.dark : Brightness.light,
              ),
            ),
            home: WelcomePage(),
          );
        });
  }
}
