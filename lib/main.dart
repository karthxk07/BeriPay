import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:beripay/widgets/contacts.dart';
import 'package:beripay/widgets/reminder.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    Contacts(),
   ReminderApp(),
    Text('Profile Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                label: ("Payments"),
                icon: Icon(Icons.currency_rupee_sharp),
                backgroundColor: Colors.green),
            BottomNavigationBarItem(
                label: ("Savings"),
                icon: Icon(Icons.savings),
                backgroundColor: Colors.yellow),
            BottomNavigationBarItem(
              label: ("Planner"),
              icon: Icon(Icons.note),
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              label: ("Bills Reminder"),
              icon: Icon(Icons.receipt),
              backgroundColor: Colors.blue,
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: const Color.fromARGB(255, 255, 255, 255),
          iconSize: 30,
          onTap: _onItemTapped,
          elevation: 1),
    );
  }
}
