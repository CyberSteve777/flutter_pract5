import 'package:flutter/material.dart';
import '../services/data_service.dart';
import '../utils/ru_plural.dart';
import 'students_screen.dart';
import 'courses_screen.dart';
import 'teachers_screen.dart';
import 'grades_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DataService dataService = DataService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Образовательная система'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: [
            _buildMenuCard(
              context,
              'Студенты',
              Icons.people,
              Colors.blue,
              (context) => const StudentsScreen(),
              formatCount(dataService.students.length, 'студент', 'студента', 'студентов'),
            ),
            _buildMenuCard(
              context,
              'Курсы',
              Icons.school,
              Colors.green,
              (context) => const CoursesScreen(),
              formatCount(dataService.courses.length, 'курс', 'курса', 'курсов'),
            ),
            _buildMenuCard(
              context,
              'Преподаватели',
              Icons.person,
              Colors.orange,
              (context) => const TeachersScreen(),
              formatCount(dataService.teachers.length, 'преподаватель', 'преподавателя', 'преподавателей'),
            ),
            _buildMenuCard(
              context,
              'Оценки',
              Icons.grade,
              Colors.purple,
              (context) => const GradesScreen(),
              formatCount(dataService.grades.length, 'оценка', 'оценки', 'оценок'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    WidgetBuilder builder,
    String subtitle,
  ) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: builder)),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: color),
              const SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}