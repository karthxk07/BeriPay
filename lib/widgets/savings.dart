import 'package:flutter/material.dart';
class SavingsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Savings App',
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
  double currentSavings = 0.0;

  void addSavings(double amount, bool saveAmount) {
    setState(() {
      double roundedAmount = double.parse(amount.toStringAsFixed(10));
      double savingAmount = saveAmount ? roundedAmount : 0;
      currentSavings += savingAmount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Savings App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Current Savings',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 10),
            Text(
              '\$$currentSavings',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Add Savings'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            // Handle text input
                          },
                          decoration: InputDecoration(
                            labelText: 'Amount',
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text('Save the Rounded Amount?'),
                            SizedBox(width: 10),
                            Checkbox(
                              value: true,
                              onChanged: (value) {
                                // Handle checkbox value
                              },
                            ),
                          ],
                        ),
                      ],
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
                          // Add the savings
                          double amount = 0.0; // Retrieve the text input
                          bool saveAmount = true; // Retrieve the checkbox value
                          addSavings(amount, saveAmount);
                          Navigator.pop(context);
                        },
                        child: Text('Add'),
                      ),
                    ],
                  ),
                );
              },
              child: Text('Add Savings'),
            ),
          ],
        ),
      ),
    );
  }
}