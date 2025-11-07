import 'package:flutter/material.dart';

class LockControlPage extends StatefulWidget {
  @override
  _LockControlPageState createState() => _LockControlPageState();
}

class _LockControlPageState extends State<LockControlPage> {
  bool isLocked = true;
  bool autoLock = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background color
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(
        title: Text('Lock Control'),
        backgroundColor: Colors.indigo,
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Lock Status Text
              Text(
                'Lock Status',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo[900],
                ),
              ),
              SizedBox(height: 10),
              Text(
                isLocked ? '🔒 Locked' : '🔓 Unlocked',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: isLocked ? Colors.red : Colors.green,
                ),
              ),
              SizedBox(height: 30),

              // Lock/Unlock Button
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isLocked = !isLocked;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isLocked ? Colors.green : Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  isLocked ? 'Unlock' : 'Lock',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 30),

              // Auto-Lock Switch
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.indigo[100],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: SwitchListTile(
                  title: Text(
                    'Auto-Lock',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo[900]),
                  ),
                  value: autoLock,
                  onChanged: (value) {
                    setState(() {
                      autoLock = value;
                    });
                  },
                  activeColor: Colors.indigo,
                ),
              ),
              SizedBox(height: 30),

              // Navigation Buttons Section
              Wrap(
                spacing: 10,
                runSpacing: 15,
                alignment: WrapAlignment.center,
                children: [
                  // Keypad Unlock Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/keypadUnlock');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    child: Text(
                      'Keypad Unlock',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),

                  // Fingerprint Unlock Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/fingerprintUnlock');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    child: Text(
                      'Fingerprint Unlock',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),

                  // Settings Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/settings');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent,
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    child: Text(
                      'Settings',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),

                  // Lock History Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/lockHistory');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding:
                          EdgeInsets.symmetric(horizontal: 45, vertical: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    child: Text(
                      'Lock History',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),

                  // Notifications Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/notifications');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pinkAccent,
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    child: Text(
                      'Notifications',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
