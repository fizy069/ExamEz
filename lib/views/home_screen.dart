import 'package:flutter/material.dart';
import 'selected_courses_screen.dart';
import '../utilities/course.dart';


class HomeScreen extends StatefulWidget {
  final String userId;

  HomeScreen({required this.userId});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Simulated course data (replace with actual data fetching)
  final List<Course> allCourses = [
    Course('Course A', 'A101', 'Monday', '10:00 AM - 11:00 AM'),
    Course('Course B', 'B202', 'Wednesday', '02:00 PM - 03:00 PM'),
    Course('Course C', 'C303', 'Friday', '01:00 PM - 02:00 PM'),
    Course('Course D', 'D404', 'Tuesday', '09:00 AM - 10:00 AM'),
    Course('Course E', 'E505', 'Thursday', '03:00 PM - 04:00 PM'),
    Course('Course F', 'E505', 'Thursday', '03:00 PM - 04:00 PM'),
    Course('', '', '', ''),
    // Add more courses as needed
  ];

  List<Course> selectedCourses = [];

  List<Course> filteredCourses = [];

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredCourses = allCourses;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Screen',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () {
              // Navigate to the SelectedCoursesScreen with selected courses
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      SelectedCoursesScreen(selectedCourses: selectedCourses.cast()),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: searchController,
              onChanged: (value) {
                // Filter courses based on search text
                setState(() {
                  filteredCourses = allCourses
                      .where((course) =>
                          course.name.toLowerCase().contains(value.toLowerCase()))
                      .toList();
                });
              },
              decoration: InputDecoration(
                labelText: 'Search Courses',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: filteredCourses.length,
                itemBuilder: (context, index) {
                  final course = filteredCourses[index];
                  bool isSelected = selectedCourses.contains(course);

                  return CourseCard(
                    course: course,
                    isSelected: isSelected,
                    onTap: () {
                      // Add or remove course from selectedCourses
                      setState(() {
                        if (isSelected) {
                          selectedCourses.remove(course);
                        } else {
                          selectedCourses.add(course);
                        }
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class CourseCard extends StatelessWidget {
  final Course course;
  final bool isSelected;
  final VoidCallback onTap;

  CourseCard({
    required this.course,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isSelected ? Colors.blue : null,
      child: ListTile(
        title: Text(course.name),
        subtitle: Text('${course.code} | ${course.day} | ${course.time}'),
        onTap: onTap,
        trailing: Icon(
          isSelected ? Icons.check_circle : Icons.circle_outlined,
          color: isSelected ? Colors.green : Colors.grey,
        ),
      ),
    );
  }
}
