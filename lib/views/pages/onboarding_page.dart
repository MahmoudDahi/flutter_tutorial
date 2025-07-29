import 'package:flutter/material.dart';
import 'package:flutter_tutorial/data/constants.dart';
import 'package:flutter_tutorial/views/widget_tree.dart';
import 'package:flutter_tutorial/views/widgets/hero_widget.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                HeroWidget(
                  title: "Welcome to My App",
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Welcome to My App to show what i was learned.",
                  style: KTextStyle.descriptionText,
                  textAlign: TextAlign.justify,
                ),
                FilledButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WidgetTree(),
                      ),
                      (route) => false,
                    );
                  },
                  style: FilledButton.styleFrom(
                    minimumSize: Size(double.infinity, 40),
                  ),
                  child: Text("Next"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
