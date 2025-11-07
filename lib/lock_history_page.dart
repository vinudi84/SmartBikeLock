import 'package:flutter/material.dart';

class LockHistoryPage extends StatelessWidget {
  final List<String> history = [
    'Locked at 08:00 AM',
    'Unlocked at 08:15 AM',
    'Locked at 12:00 PM',
    'Unlocked at 01:00 PM',
    'Locked at 05:30 PM',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background color
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        title: Text('Lock History'),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.builder(
          itemCount: history.length,
          itemBuilder: (context, index) {
            bool isLocked = history[index].toLowerCase().contains('locked');
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: isLocked ? Colors.red[100] : Colors.green[100],
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: Icon(
                  isLocked ? Icons.lock : Icons.lock_open,
                  color: isLocked ? Colors.red[700] : Colors.green[700],
                  size: 30,
                ),
                title: Text(
                  history[index],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange[900],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
