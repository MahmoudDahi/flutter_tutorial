import 'package:flutter/material.dart';
import 'package:flutter_tutorial/data/constants.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: KTextStyle.titleCyanText,
              ),
              Text(
                description,
                style: KTextStyle.descriptionText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
