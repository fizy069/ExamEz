import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

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
    return WillPopScope(
      onWillPop: () async {
        // Handle back button press
        Navigator.of(context).pop();
        return true;
      },
      child: Scaffold(
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
              // Navigate back when back button is pressed
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Stack(
          children: [
            ListView.builder(
              itemCount: exams.length,
              itemBuilder: (context, index) {
                final exam = exams[index];
                return SubjectCard(exam: exam);
              },
            ),
            BlurOverlay(), // Overlay for blur effect
          ],
        ),
      ),
    );
  }

  // Generate a random color
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

class BlurOverlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Do nothing on tap to prevent interaction with the blurred background
      },
      child: Container(
        color: Colors.black.withOpacity(0.5), // Semi-transparent black color
        constraints: BoxConstraints.expand(), // Fullscreen overlay
      ),
    );
  }
}

class SubjectCard extends StatefulWidget {
  final Exam exam;

  const SubjectCard({Key? key, required this.exam}) : super(key: key);

  @override
  _SubjectCardState createState() => _SubjectCardState();
}

class _SubjectCardState extends State<SubjectCard> {
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isFocused = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isFocused = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            if (_isFocused)
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 10.0,
                spreadRadius: 1.0,
              ),
          ],
        ),
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Card(
          color: widget.exam.color,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.exam.subject,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: _isColorDark(widget.exam.color) ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Comprehensive Exam: ${widget.exam.comprehensiveExam.toString()}',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: _isColorDark(widget.exam.color) ? Colors.white : Colors.black,
                  ),
                ),
                Text(
                  'Midsem Exam: ${widget.exam.midsemExam.toString()}',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: _isColorDark(widget.exam.color) ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _isColorDark(Color color) {
    final luminance = (0.2126 * color.red + 0.7152 * color.green + 0.0722 * color.blue);
    return luminance < 128;
  }
}
