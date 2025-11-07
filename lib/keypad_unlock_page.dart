import 'package:flutter/material.dart';

class KeypadUnlockPage extends StatefulWidget {
  @override
  _KeypadUnlockPageState createState() => _KeypadUnlockPageState();
}

class _KeypadUnlockPageState extends State<KeypadUnlockPage> {
  final TextEditingController pinController = TextEditingController();
  final String correctPin = '1234';
  String message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background color
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: Text('Keypad Unlock'),
        backgroundColor: Colors.teal,
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // PIN input label
              Text(
                'Enter Your 4-Digit PIN',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal[800],
                ),
              ),
              SizedBox(height: 20),

              // PIN TextField with decoration
              TextField(
                controller: pinController,
                keyboardType: TextInputType.number,
                obscureText: true,
                maxLength: 4,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  letterSpacing: 10,
                  color: Colors.teal[900],
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.teal[50],
                  counterText: "",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.teal, width: 2),
                  ),
                  hintText: '••••',
                  hintStyle: TextStyle(letterSpacing: 10),
                ),
              ),
              SizedBox(height: 30),

              // Unlock button with gradient style
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (pinController.text == correctPin) {
                      message = 'Unlocked Successfully!';
                    } else {
                      message = 'Incorrect PIN!';
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: Colors.teal, // button color
                ),
                child: Text(
                  'Unlock',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 25),

              // Message display
              Text(
                message,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: message == 'Unlocked Successfully!'
                      ? Colors.green
                      : Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
