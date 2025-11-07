import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  final List<String> notifications = [
    'Lock was unlocked at 08:15 AM',
    'Auto-lock enabled at 12:00 PM',
    'Lock was locked at 05:30 PM',
    'Failed unlock attempt at 06:00 PM',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background color
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            bool isAlert = notifications[index].toLowerCase().contains('failed');
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: isAlert ? Colors.red[100] : Colors.blue[100],
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: Icon(
                  isAlert ? Icons.warning : Icons.notifications,
                  color: isAlert ? Colors.red[700] : Colors.blue[700],
                  size: 28,
                ),
                title: Text(
                  notifications[index],
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[900],
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
