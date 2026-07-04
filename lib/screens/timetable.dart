import 'package:flutter/material.dart';
import 'widgets.dart';

class TimetableScreen extends StatefulWidget {
  const TimetableScreen({super.key});
  @override
  State<TimetableScreen> createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen> {
  String selectedDay = 'Monday';

  final List<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
  ];

  final Map<String, List<Map<String, String>>> timetable = {
    'Monday': [
      {
        'time': '9:00 - 10:00',
        'subject': 'Mathematics I',
        'room': 'Room 101',
        'teacher': 'Dr. Sharma',
      },
      {
        'time': '10:00 - 11:00',
        'subject': 'C Programming',
        'room': 'Lab 3',
        'teacher': 'Prof. Verma',
      },
      {
        'time': '11:00 - 12:00',
        'subject': 'Physics',
        'room': 'Room 205',
        'teacher': 'Dr. Gupta',
      },
      {
        'time': '1:00 - 2:00',
        'subject': 'English',
        'room': 'Room 102',
        'teacher': 'Prof. Singh',
      },
      {
        'time': '2:00 - 3:00',
        'subject': 'Workshop',
        'room': 'Workshop A',
        'teacher': 'Prof. Kumar',
      },
    ],
    'Tuesday': [
      {
        'time': '9:00 - 10:00',
        'subject': 'Physics',
        'room': 'Room 205',
        'teacher': 'Dr. Gupta',
      },
      {
        'time': '10:00 - 12:00',
        'subject': 'C Programming Lab',
        'room': 'Lab 1',
        'teacher': 'Prof. Verma',
      },
      {
        'time': '1:00 - 2:00',
        'subject': 'Mathematics I',
        'room': 'Room 101',
        'teacher': 'Dr. Sharma',
      },
      {
        'time': '2:00 - 3:00',
        'subject': 'English',
        'room': 'Room 102',
        'teacher': 'Prof. Singh',
      },
    ],
    'Wednesday': [
      {
        'time': '9:00 - 10:00',
        'subject': 'C Programming',
        'room': 'Lab 3',
        'teacher': 'Prof. Verma',
      },
      {
        'time': '10:00 - 11:00',
        'subject': 'Mathematics I',
        'room': 'Room 101',
        'teacher': 'Dr. Sharma',
      },
      {
        'time': '11:00 - 12:00',
        'subject': 'Physics Lab',
        'room': 'Physics Lab',
        'teacher': 'Dr. Gupta',
      },
      {
        'time': '1:00 - 2:00',
        'subject': 'Workshop',
        'room': 'Workshop A',
        'teacher': 'Prof. Kumar',
      },
    ],
    'Thursday': [
      {
        'time': '9:00 - 10:00',
        'subject': 'English',
        'room': 'Room 102',
        'teacher': 'Prof. Singh',
      },
      {
        'time': '10:00 - 11:00',
        'subject': 'Physics',
        'room': 'Room 205',
        'teacher': 'Dr. Gupta',
      },
      {
        'time': '11:00 - 12:00',
        'subject': 'Mathematics I',
        'room': 'Room 101',
        'teacher': 'Dr. Sharma',
      },
      {
        'time': '1:00 - 3:00',
        'subject': 'C Programming Lab',
        'room': 'Lab 1',
        'teacher': 'Prof. Verma',
      },
    ],
    'Friday': [
      {
        'time': '9:00 - 10:00',
        'subject': 'Mathematics I',
        'room': 'Room 101',
        'teacher': 'Dr. Sharma',
      },
      {
        'time': '10:00 - 11:00',
        'subject': 'English',
        'room': 'Room 102',
        'teacher': 'Prof. Singh',
      },
      {
        'time': '11:00 - 12:00',
        'subject': 'C Programming',
        'room': 'Lab 3',
        'teacher': 'Prof. Verma',
      },
      {
        'time': '1:00 - 2:00',
        'subject': 'Physics',
        'room': 'Room 205',
        'teacher': 'Dr. Gupta',
      },
    ],
    'Saturday': [
      {
        'time': '9:00 - 11:00',
        'subject': 'Physics Lab',
        'room': 'Physics Lab',
        'teacher': 'Dr. Gupta',
      },
      {
        'time': '11:00 - 1:00',
        'subject': 'Workshop',
        'room': 'Workshop A',
        'teacher': 'Prof. Kumar',
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    final classes = timetable[selectedDay] ?? [];
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFF6B00), Color(0xFFFF9933)],
            ),
          ),
        ),
        title: const Text(
          '📅 Timetable',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          const TricolorStrip(),

          // Day selector
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: days.map((day) {
                  final selected = day == selectedDay;
                  return GestureDetector(
                    onTap: () => setState(() => selectedDay = day),
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: selected
                            ? const Color(0xFFFF6B00)
                            : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        day.substring(0, 3),
                        style: TextStyle(
                          color: selected ? Colors.white : Colors.black87,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          const SizedBox(height: 8),

          // Classes list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: classes.length,
              itemBuilder: (context, index) {
                final cls = classes[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      // Time strip
                      Container(
                        width: 80,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF6B00).withOpacity(0.12),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(14),
                            bottomLeft: Radius.circular(14),
                          ),
                        ),
                        child: Text(
                          cls['time']!.replaceAll(' - ', '\n'),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFF6B00),
                          ),
                        ),
                      ),
                      // Subject info
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cls['subject']!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on_outlined,
                                    size: 14,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    cls['room']!,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  const Icon(
                                    Icons.person_outline,
                                    size: 14,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    cls['teacher']!,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
