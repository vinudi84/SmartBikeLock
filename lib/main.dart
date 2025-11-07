import 'package:flutter/material.dart';
import 'login_page.dart';
import 'register_page.dart';
import 'lock_control_page.dart';
import 'keypad_unlock_page.dart';
import 'fingerprint_unlock_page.dart';
import 'settings_page.dart';
import 'lock_history_page.dart';
import 'notifications_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Bicycle Lock',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/lockControl': (context) => LockControlPage(),
        '/keypadUnlock': (context) => KeypadUnlockPage(),
        '/fingerprintUnlock': (context) => FingerprintUnlockPage(),
        '/settings': (context) => SettingsPage(),
        '/lockHistory': (context) => LockHistoryPage(),
        '/notifications': (context) => NotificationsPage(),
      },
    );
  }
}
