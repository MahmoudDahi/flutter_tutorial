import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key, required this.title});

  final String title;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController controler = TextEditingController();
  bool? isChecked = false;
  bool isSwitch = false;
  double sliderValue = 0;
  String? selectMenu = 'one';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: Duration(seconds: 1),
                      content: Text('Hello World'),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                child: Text('Open snakbar'),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Alert Title'),
                        content: Text('Alert Content'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Cancel'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Open Alert Dialog'),
              ),
              DropdownButton(
                  value: selectMenu,
                  items: [
                    DropdownMenuItem(
                      value: 'one',
                      child: Text('One'),
                    ),
                    DropdownMenuItem(
                      value: 'two',
                      child: Text('Two'),
                    ),
                    DropdownMenuItem(
                      value: 'three',
                      child: Text('Three'),
                    ),
                  ],
                  onChanged: (String? value) {
                    setState(() {
                      selectMenu = value;
                    });
                  }),
              TextField(
                controller: controler,
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
                onEditingComplete: () => setState(() {}),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                controler.value.text.isEmpty
                    ? 'Enter your name'
                    : controler.value.text,
              ),
              SizedBox(
                height: 20,
              ),
              Checkbox(
                tristate: true,
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = value;
                  });
                },
              ),
              CheckboxListTile(
                tristate: true,
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = value;
                  });
                },
                title: Text('CheckboxListTile'),
                subtitle: Text('This is a subtitle'),
                controlAffinity: ListTileControlAffinity.leading,
                dense: true,
              ),
              SwitchListTile.adaptive(
                title: Text('SwitchListTile'),
                value: isSwitch,
                onChanged: (value) {
                  setState(() {
                    isSwitch = value;
                  });
                },
              ),
              Slider.adaptive(
                max: 10,
                label: sliderValue.toString(),
                divisions: 10,
                value: sliderValue,
                onChanged: (value) {
                  setState(() {
                    sliderValue = value;
                  });
                },
              ),
              InkWell(
                splashColor: Colors.teal,
                onTap: () {},
                child: Container(
                  height: 50,
                  color: Colors.white12,
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                child: Text('OutlinedButton'),
              ),
              TextButton(
                onPressed: () {},
                child: Text('TextButton'),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.add),
              ),
              BackButton(),
              CloseButton(),
              FilledButton(
                onPressed: () {},
                child: Text('FilledButton'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
