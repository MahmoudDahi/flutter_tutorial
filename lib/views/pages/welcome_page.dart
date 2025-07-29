import 'package:flutter/material.dart';
import 'package:flutter_tutorial/views/pages/login_page.dart';
import 'package:flutter_tutorial/views/pages/onboarding_page.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  'assets/lotties/welcome.json',
                  height: 200,
                ),
                SizedBox(height: 20),
                FittedBox(
                  child: Text(
                    'Flutter Map',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 50,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                FilledButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OnboardingPage(),
                    ),
                  ),
                  style: FilledButton.styleFrom(
                    minimumSize: Size(double.infinity, 40),
                  ),
                  child: Text('Get Started'),
                ),
                TextButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(
                        title: "Login",
                      ),
                    ),
                  ),
                  style: FilledButton.styleFrom(
                    minimumSize: Size(double.infinity, 40),
                  ),
                  child: Text('Login'),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
