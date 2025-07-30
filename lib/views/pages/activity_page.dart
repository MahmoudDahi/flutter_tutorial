import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../data/classes/activity_class.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  late Future<Activity> futureActivity;

  @override
  void initState() {
    futureActivity = fetchActivity();
    super.initState();
  }

  Future<Activity> fetchActivity() async {
    final response =
        await http.get(Uri.parse('https://bored-api.appbrewery.com/random'));

    if (response.statusCode == 200) {
      return Activity.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load activity');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Random Activity')),
      body: FutureBuilder<Activity>(
        future: futureActivity,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final activity = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  Text('Activity: ${activity.activity}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text('Type: ${activity.type}'),
                  Text('Participants: ${activity.participants}'),
                  Text('Price: ${activity.price}'),
                  Text('Availability: ${activity.availability}'),
                  Text('Accessibility: ${activity.accessibility}'),
                  Text('Duration: ${activity.duration}'),
                  Text('Kid Friendly: ${activity.kidFriendly ? "Yes" : "No"}'),
                  const SizedBox(height: 10),
                  Text('Link:',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text('Key: ${activity.key}'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        futureActivity = fetchActivity();
                      });
                    },
                    child: const Text('Load Another'),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: Text('No activity found.'));
          }
        },
      ),
    );
  }
}
