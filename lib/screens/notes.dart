import 'package:flutter/material.dart';
import 'widgets.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});
  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  String selectedBranch = 'CSE';
  String selectedSem = 'Sem 1';

  final List<String> branches = ['CSE', 'ECE', 'ME', 'CE', 'EE'];
  final List<String> semesters = [
    'Sem 1',
    'Sem 2',
    'Sem 3',
    'Sem 4',
    'Sem 5',
    'Sem 6',
    'Sem 7',
    'Sem 8',
  ];

  final Map<String, List<Map<String, String>>> notes = {
    'CSE-Sem 1': [
      {
        'subject': 'Mathematics I',
        'topic': 'Differential Calculus',
        'size': '2.4 MB',
      },
      {'subject': 'Physics', 'topic': 'Wave Optics', 'size': '1.8 MB'},
      {'subject': 'C Programming', 'topic': 'Basics & Loops', 'size': '3.1 MB'},
      {'subject': 'English', 'topic': 'Communication Skills', 'size': '1.2 MB'},
    ],
    'CSE-Sem 2': [
      {
        'subject': 'Mathematics II',
        'topic': 'Integral Calculus',
        'size': '2.8 MB',
      },
      {
        'subject': 'Data Structures',
        'topic': 'Arrays & Linked List',
        'size': '3.5 MB',
      },
      {
        'subject': 'Digital Electronics',
        'topic': 'Logic Gates',
        'size': '2.1 MB',
      },
    ],
    'ECE-Sem 1': [
      {
        'subject': 'Mathematics I',
        'topic': 'Differential Calculus',
        'size': '2.4 MB',
      },
      {
        'subject': 'Basic Electronics',
        'topic': 'Diodes & Transistors',
        'size': '2.9 MB',
      },
      {'subject': 'Physics', 'topic': 'Electromagnetism', 'size': '1.8 MB'},
    ],
  };

  List<Map<String, String>> get currentNotes {
    final key = '$selectedBranch-$selectedSem';
    return notes[key] ??
        [
          {
            'subject': 'Coming Soon',
            'topic': 'Notes will be added soon!',
            'size': '-',
          },
        ];
  }

  @override
  Widget build(BuildContext context) {
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
              colors: [Color(0xFFFF9933), Color(0xFFFF6B00)],
            ),
          ),
        ),
        title: const Text(
          '📚 Notes',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          const TricolorStrip(),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Select Branch:',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: branches.map((b) {
                      final selected = b == selectedBranch;
                      return GestureDetector(
                        onTap: () => setState(() => selectedBranch = b),
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: selected
                                ? const Color(0xFFFF9933)
                                : Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            b,
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
                const SizedBox(height: 10),
                const Text(
                  'Select Semester:',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: semesters.map((s) {
                      final selected = s == selectedSem;
                      return GestureDetector(
                        onTap: () => setState(() => selectedSem = s),
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: selected
                                ? const Color(0xFF138808)
                                : Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            s,
                            style: TextStyle(
                              color: selected ? Colors.white : Colors.black87,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: currentNotes.length,
              itemBuilder: (context, index) {
                final note = currentNotes[index];
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
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(14),
                    leading: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF9933).withOpacity(0.15),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.picture_as_pdf,
                        color: Color(0xFFFF9933),
                        size: 28,
                      ),
                    ),
                    title: Text(
                      note['subject']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    subtitle: Text(
                      note['topic']!,
                      style: const TextStyle(fontSize: 13),
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.download_outlined,
                          color: Color(0xFF138808),
                        ),
                        Text(
                          note['size']!,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
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
