import 'package:exam_ezx/utilities/course.dart';
import 'package:flutter/material.dart';
 // Import the Course class

class SelectedCoursesScreen extends StatelessWidget {
  final List<Course> selectedCourses;

  SelectedCoursesScreen({required this.selectedCourses});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timetable'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: buildTimetable(),
      ),
    );
  }

 Widget buildTimetable() {
  // Assuming a simple timetable structure with days and time slots
  List<String> days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];
  List<String> timeSlots = [
    '08:00 AM - 09:00 AM',
    '09:00 AM - 10:00 AM',
    '10:00 AM - 11:00 AM',
    '11:00 AM - 12:00 PM',
    '12:00 PM - 01:00 PM',
    '01:00 PM - 02:00 PM',
    '02:00 PM - 03:00 PM',
    '03:00 PM - 04:00 PM',
    '04:00 PM - 05:00 PM',
    '05:00 PM - 06:00 PM',
  ];

  return GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: days.length + 1, // Number of columns
    ),
    itemCount: (timeSlots.length + 1) * days.length,
    itemBuilder: (context, index) {
      // Calculate row and column indices
      int row = index ~/ (days.length + 1);
      int col = index % (days.length + 1);

      // Return header cells for the first row and column
      if (row == 0 && col == 0) {
        return buildEmptyCell();
      } else if (row == 0) {
        return buildHeaderCell(days[col - 1]);
      } else if (col == 0) {
        return buildHeaderCell(timeSlots[row - 1]);
      }

      // Calculate day and time slot
      String day = days[col - 1];
      String timeSlot = timeSlots[row - 1];

      // Find the course for the current day and time slot
      Course? course = selectedCourses.firstWhere(
        (c) => c.day == day && c.time == timeSlot,
        orElse: () => Course('', '', '', ''),
      );

      // Return the course cell if the course matches the time slot
      if (course != null) {
        return buildCourseCell(course);
      } else {
        // Return an empty cell if no course matches the time slot
        return buildEmptyCell();
      }
    },
  );
}


  Widget buildHeaderCell(String text) {
    return Container(
      padding: EdgeInsets.all(8.0),
      alignment: Alignment.center,
      color: Colors.grey[300],
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildEmptyCell() {
    return buildHeaderCell('');
  }

Widget buildCourseCell(Course? course) {
  if (course != null && course.name.isNotEmpty) {
    return Container(
      padding: EdgeInsets.all(8.0),
      alignment: Alignment.center,
      color: Colors.green[100],
      child: Text(course.name),
    );
  } else {
    return Container(
      padding: EdgeInsets.all(8.0),
      alignment: Alignment.center,
      color: Colors.white,
      child: Text(''),
    );
  }
}


}
