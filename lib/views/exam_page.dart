import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Exam {
  final String subject;
  final String comprehensiveExam;
  final String midsemExam;
  final Color color;

  Exam({required this.subject, required this.comprehensiveExam, required this.midsemExam, required this.color});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        // accentColor: Colors.blueAccent,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: ExamsPage(),
    );
  }
}

class ExamsPage extends StatelessWidget {
  final List<Exam> exams = [
    Exam(subject: 'Physics', comprehensiveExam: 'nigger', midsemExam: 'Physics Midsem Exam', color: Colors.red),
    Exam(subject: 'Mathematics', comprehensiveExam: 'nigger', midsemExam: 'Maths Midsem Exam', color: Colors.green),
    Exam(subject: 'Chemistry', comprehensiveExam: 'nigger', midsemExam: 'Chemistry Midsem Exam', color: Colors.blue),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exams'),
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
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Comprehensive Exam: ${exam.comprehensiveExam}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            Text(
              'Midsem Exam: ${exam.midsemExam}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
