import 'package:flutter/material.dart';
import 'widgets.dart';

class PYQScreen extends StatefulWidget {
  const PYQScreen({super.key});
  @override
  State<PYQScreen> createState() => _PYQScreenState();
}

class _PYQScreenState extends State<PYQScreen> {
  String selectedBranch = 'CSE';
  String selectedYear = '2024';

  final List<String> branches = ['CSE', 'ECE', 'ME', 'CE', 'EE'];
  final List<String> years = ['2024', '2023', '2022', '2021', '2020'];

  final Map<String, List<Map<String, String>>> pyqs = {
    'CSE-2024': [
      {'subject': 'Data Structures', 'exam': 'End Semester', 'size': '1.2 MB'},
      {'subject': 'DBMS', 'exam': 'End Semester', 'size': '0.9 MB'},
      {'subject': 'OS', 'exam': 'Mid Semester', 'size': '0.7 MB'},
      {'subject': 'CN', 'exam': 'End Semester', 'size': '1.1 MB'},
    ],
    'CSE-2023': [
      {'subject': 'Data Structures', 'exam': 'End Semester', 'size': '1.0 MB'},
      {'subject': 'DBMS', 'exam': 'End Semester', 'size': '0.8 MB'},
      {'subject': 'Algorithms', 'exam': 'Mid Semester', 'size': '0.6 MB'},
    ],
    'ECE-2024': [
      {
        'subject': 'Signals & Systems',
        'exam': 'End Semester',
        'size': '1.3 MB',
      },
      {'subject': 'VLSI Design', 'exam': 'End Semester', 'size': '1.1 MB'},
      {'subject': 'Microprocessors', 'exam': 'Mid Semester', 'size': '0.9 MB'},
    ],
  };

  List<Map<String, String>> get currentPYQs {
    final key = '$selectedBranch-$selectedYear';
    return pyqs[key] ??
        [
          {
            'subject': 'Coming Soon',
            'exam': 'Papers will be added soon!',
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
              colors: [Color(0xFF138808), Color(0xFF0D6B06)],
            ),
          ),
        ),
        title: const Text(
          '📝 PYQ Papers',
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
                                ? const Color(0xFF138808)
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
                  'Select Year:',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: years.map((y) {
                      final selected = y == selectedYear;
                      return GestureDetector(
                        onTap: () => setState(() => selectedYear = y),
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: selected
                                ? const Color(0xFF000080)
                                : Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            y,
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
              itemCount: currentPYQs.length,
              itemBuilder: (context, index) {
                final pyq = currentPYQs[index];
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
                        color: const Color(0xFF138808).withOpacity(0.15),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.quiz_outlined,
                        color: Color(0xFF138808),
                        size: 28,
                      ),
                    ),
                    title: Text(
                      pyq['subject']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    subtitle: Text(
                      pyq['exam']!,
                      style: const TextStyle(fontSize: 13),
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.download_outlined,
                          color: Color(0xFFFF9933),
                        ),
                        Text(
                          pyq['size']!,
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
