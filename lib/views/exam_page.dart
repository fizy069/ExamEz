import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';
import 'package:googleapis/calendar/v3.dart' as calendar;
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:http/http.dart' as http;


class Exam {
  final String subject;
  final DateTime comprehensiveExam;
  final DateTime midsemExam;
  final Color color;

  Exam({
    required this.subject,
    required this.comprehensiveExam,
    required this.midsemExam,
    required this.color,
  });
}

class ExamsPage extends StatelessWidget {
  final List<Exam> exams = [
    Exam(
      subject: 'Physics',
      comprehensiveExam: DateTime(2024, 5, 15),
      midsemExam: DateTime(2024, 3, 10),
      color: _generateRandomColor(),
    ),
    Exam(
      subject: 'Mathematics',
      comprehensiveExam: DateTime(2024, 6, 20),
      midsemExam: DateTime(2024, 4, 12),
      color: _generateRandomColor(),
    ),
    Exam(
      subject: 'Chemistry',
      comprehensiveExam: DateTime(2024, 6, 5),
      midsemExam: DateTime(2024, 4, 5),
      color: _generateRandomColor(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Exams',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            letterSpacing: 1.5,
          ),
          
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView.builder(
        itemCount: exams.length,
        itemBuilder: (context, index) {
          final exam = exams[index];
          return SubjectCard(exam: exam);
        },
      ),
    );
  }

  
  static Color _generateRandomColor() {
    final Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }
}

class SubjectCard extends StatelessWidget {
  final Exam exam;

  const SubjectCard({Key? key, required this.exam}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: exam.color,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              exam.subject,
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: _isColorDark(exam.color) ? Colors.white : Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Comprehensive Exam: ${exam.comprehensiveExam.toString()}',
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: _isColorDark(exam.color) ? Colors.white : Colors.black,
              ),
            ),
            Text(
              'Midsem Exam: ${exam.midsemExam.toString()}',
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: _isColorDark(exam.color) ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Check if a color is dark
  static bool _isColorDark(Color color) {
    // This is a simple heuristic to determine if a color is dark or light.
    // You can adjust this threshold as needed.
    final luminance = (0.2126 * color.red + 0.7152 * color.green + 0.0722 * color.blue);
    return luminance < 128;
  }
}
