import 'package:flutter/material.dart';
import 'package:flutter_tutorial/data/notifiers.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectPageNotifier,
      builder: (context, selectPage, child) => NavigationBar(
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedIndex: selectPage,
        onDestinationSelected: (value) => selectPageNotifier.value = value,
      ),
    );
  }
}
