import 'package:flutter/material.dart';
class FintechApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fintech App',
      theme: ThemeData.dark(),
      home: BillReminderPage(),
    );
  }
}

class BillReminderPage extends StatefulWidget {
  @override
  _BillReminderPageState createState() => _BillReminderPageState();
}

class _BillReminderPageState extends State<BillReminderPage> {
  List<String> billReminders = [];

  void addBillReminder(String reminder) {
    setState(() {
      billReminders.add(reminder);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bill Payment Reminder'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Add Bill Reminder'),
                  content: TextField(
                    onChanged: (value) {
                      // Handle text input
                    },
                    decoration: InputDecoration(
                      labelText: 'Bill Name',
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Add the bill reminder
                        String reminder = ''; // Retrieve the text input
                        setState(() {
                          addBillReminder(reminder);
                        });
                        Navigator.pop(context);
                      },
                      child: Text('Add'),
                    ),
                  ],
                ),
              );
            },
            child: Text('Add Bill Reminder'),
          ),
          SizedBox(height: 20),
          Text(
            'Bill Reminders',
            style: TextStyle(fontSize: 24),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: billReminders.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(billReminders[index]),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BillReminderListPage(reminders: billReminders)),
              );
            },
            child: Text('View List'),
          ),
        ],
      ),
    );
  }
}

class BillReminderListPage extends StatelessWidget {
  final List<String> reminders;

  BillReminderListPage({required this.reminders});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bill Reminder List'),
      ),
      body: ListView.builder(
        itemCount: reminders.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(reminders[index]),
          );
        },
      ),
    );
  }
}