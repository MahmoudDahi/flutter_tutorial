import 'package:flutter/material.dart';
import 'package:flutter_tutorial/views/widget_tree.dart';
import 'package:flutter_tutorial/views/widgets/hero_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerEmail = TextEditingController(text: '123');
  TextEditingController controllerPassword = TextEditingController(text: '456');
  final String confirmEmail = '123';
  final String confirmPassword = '456';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: widthScreen > 500 ? .5 : 1,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  HeroWidget(
                    title: widget.title,
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: controllerEmail,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: controllerPassword,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () => onLoginPressed(),
                    style: FilledButton.styleFrom(
                      minimumSize: Size(double.infinity, 40),
                    ),
                    child: Text(widget.title),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onLoginPressed() {
    if (confirmEmail == controllerEmail.text &&
        confirmPassword == controllerPassword.text) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => WidgetTree(),
        ),
        (route) => false,
      );
    }
  }
}
