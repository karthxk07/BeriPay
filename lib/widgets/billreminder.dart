import 'package:flutter/material.dart';
class BillReminderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bill Reminder',
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> bills = [];

  void addBill(String bill) {
    setState(() {
      bills.add(bill);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bill Reminder'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Add Bill'),
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
                        // Add the bill
                        String bill = ''; // Retrieve the text input
                        addBill(bill);
                        Navigator.pop(context);
                      },
                      child: Text('Add'),
                    ),
                  ],
                ),
              );
            },
            child: Text('Add Bill'),
          ),
          SizedBox(height: 20),
          Text(
            'Bills',
            style: TextStyle(fontSize: 24),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: bills.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(bills[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}