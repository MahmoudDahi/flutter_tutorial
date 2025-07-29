import 'package:flutter/material.dart';
import 'package:flutter_tutorial/views/pages/course_page.dart';
import 'package:flutter_tutorial/views/widgets/container_widget.dart';
import 'package:flutter_tutorial/views/widgets/hero_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final list = [
      'Fix Bugs',
      'Clean UI',
      'Basic Layout',
      'Keys Concept',
      'State Management',
      'Navigation',
      'Animation',
      'Performance Optimization',
      'Testing',
      'Deployment',
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            HeroWidget(
              title: 'Flutter App',
              nextPage: CoursePage(),
            ),
            ...List.generate(
              list.length,
              (index) => ContainerWidget(
                title: list[index],
                description: 'This is a home page',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
