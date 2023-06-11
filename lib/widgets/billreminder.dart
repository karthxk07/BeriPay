import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class BillReminder {
  final String time;
  final String description;

  BillReminder({required this.time, required this.description});
}

class BillReminderScreen extends StatefulWidget {
  @override
  _BillReminderScreenState createState() => _BillReminderScreenState();
}

class _BillReminderScreenState extends State<BillReminderScreen> {
  List<BillReminder> reminders = [];

  TextEditingController timeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    timeController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void _addReminder() {
    setState(() {
      String time = timeController.text;
      String description = descriptionController.text;

      if (time.isNotEmpty && description.isNotEmpty) {
        BillReminder reminder =
            BillReminder(time: time, description: description);
        reminders.add(reminder);

        // Clear the text fields after adding the reminder
        timeController.clear();
        descriptionController.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bill Reminders'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: timeController,
                  decoration: InputDecoration(
                    labelText: 'Time',
                  ),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Description',
                  ),
                ),
                ElevatedButton(
                  onPressed: _addReminder,
                  child: Text('Add Reminder'),
                ),
              ],
            ),
          ),
          Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: reminders.length,
              itemBuilder: (context, index) {
                BillReminder reminder = reminders[index];
                return ListTile(
                  title: Text(reminder.time),
                  subtitle: Text(reminder.description),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
