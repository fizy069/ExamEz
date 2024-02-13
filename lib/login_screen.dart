import 'package:flutter/material.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login Screen',
          style: TextStyle(fontWeight: FontWeight.bold), // Custom font style
        ),
        backgroundColor: Colors.blue, // Custom background color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: idController,
              decoration: InputDecoration(
                labelText: 'Enter ID Number',
                prefixIcon: Icon(Icons.person), // Add an icon
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0), // Rounded corners
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Access the ID number using idController.text
                String idNumber = idController.text;

                // Navigate to HomeScreen with the entered user ID
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(userId: idNumber),
                  ),
                );
              },
              child: Text(
                'Submit',
                style: TextStyle(fontSize: 18), // Custom button text style
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Custom button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), // Rounded corners
                ),
                elevation: 5, // Add a shadow
              ),
            ),
          ],
        ),
      ),
    );
  }
}
