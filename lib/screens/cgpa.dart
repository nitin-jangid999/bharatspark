import 'package:flutter/material.dart';
import 'widgets.dart';

class CGPAScreen extends StatefulWidget {
  const CGPAScreen({super.key});
  @override
  State<CGPAScreen> createState() => _CGPAScreenState();
}

class _CGPAScreenState extends State<CGPAScreen> {
  final List<Map<String, dynamic>> subjects = [];
  final List<Map<String, dynamic>> semesters = [];

  bool isSGPAMode = true;
  double result = 0.0;

  @override
  void initState() {
    super.initState();
    _addSubject();
    _addSubject();
    _addSubject();
    _addSemester();
    _addSemester();
  }

  void _addSubject() {
    subjects.add({
      'name': TextEditingController(),
      'credits': TextEditingController(),
      'gradeValue': 10.0,
    });
  }

  void _addSemester() {
    semesters.add({
      'sgpa': TextEditingController(),
      'credits': TextEditingController(),
    });
  }

  final List<Map<String, dynamic>> gradeOptions = [
    {'label': 'O — 10', 'value': 10.0},
    {'label': 'A+ — 9', 'value': 9.0},
    {'label': 'A — 8', 'value': 8.0},
    {'label': 'B+ — 7', 'value': 7.0},
    {'label': 'B — 6', 'value': 6.0},
    {'label': 'C — 5', 'value': 5.0},
    {'label': 'P — 4', 'value': 4.0},
    {'label': 'F — 0', 'value': 0.0},
  ];

  void calculate() {
    if (isSGPAMode) {
      double totalPoints = 0;
      double totalCredits = 0;
      for (var sub in subjects) {
        final credits = double.tryParse(sub['credits'].text) ?? 0;
        final grade = sub['gradeValue'] as double;
        totalPoints += credits * grade;
        totalCredits += credits;
      }
      setState(() {
        result = totalCredits > 0 ? totalPoints / totalCredits : 0;
      });
    } else {
      double totalPoints = 0;
      double totalCredits = 0;
      for (var sem in semesters) {
        final credits = double.tryParse(sem['credits'].text) ?? 0;
        final sgpa = double.tryParse(sem['sgpa'].text) ?? 0;
        totalPoints += credits * sgpa;
        totalCredits += credits;
      }
      setState(() {
        result = totalCredits > 0 ? totalPoints / totalCredits : 0;
      });
    }
  }

  String get division {
    if (result >= 7) return '1st Division with Distinction 🏆';
    if (result >= 6) return '1st Division ⭐';
    if (result >= 5) return '2nd Division 👍';
    if (result >= 4) return 'Pass 📋';
    if (result > 0) return 'Fail ❌';
    return 'Enter details below';
  }

  Color get resultColor {
    if (result >= 7) return const Color(0xFF138808);
    if (result >= 6) return const Color(0xFF1565C0);
    if (result >= 5) return const Color(0xFFFF9933);
    if (result >= 4) return Colors.orange;
    if (result > 0) return Colors.red;
    return const Color(0xFF1565C0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4FF),
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF1565C0), Color(0xFF0D47A1)],
            ),
          ),
        ),
        title: const Text(
          '🎓 SKIT CGPA Calculator',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          const TricolorStrip(),

          // Mode toggle
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() {
                      isSGPAMode = true;
                      result = 0;
                    }),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: isSGPAMode
                            ? const Color(0xFF1565C0)
                            : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'SGPA Calculator',
                          style: TextStyle(
                            color: isSGPAMode ? Colors.white : Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() {
                      isSGPAMode = false;
                      result = 0;
                    }),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: !isSGPAMode
                            ? const Color(0xFF1565C0)
                            : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'CGPA Calculator',
                          style: TextStyle(
                            color: !isSGPAMode ? Colors.white : Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Result card
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [resultColor.withOpacity(0.85), resultColor],
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Text(
                  isSGPAMode ? 'Your SGPA' : 'Your CGPA',
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
                const SizedBox(height: 6),
                Text(
                  result.toStringAsFixed(2),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 52,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (result > 0)
                  Text(
                    'Percentage: ${(result * 10).toStringAsFixed(1)}%',
                    style: const TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                const SizedBox(height: 4),
                Text(
                  division,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          // Input area
          Expanded(child: isSGPAMode ? _buildSGPAInputs() : _buildCGPAInputs()),

          // Buttons
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      setState(() {
                        if (isSGPAMode) {
                          _addSubject();
                        } else {
                          _addSemester();
                        }
                      });
                    },
                    icon: const Icon(Icons.add, color: Color(0xFF1565C0)),
                    label: Text(
                      isSGPAMode ? 'Add Subject' : 'Add Semester',
                      style: const TextStyle(color: Color(0xFF1565C0)),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFF1565C0)),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: calculate,
                    icon: const Icon(Icons.calculate, color: Colors.white),
                    label: const Text(
                      'Calculate',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1565C0),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSGPAInputs() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: subjects.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 6),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Subject ${index + 1}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1565C0),
                    ),
                  ),
                  const Spacer(),
                  if (subjects.length > 1)
                    GestureDetector(
                      onTap: () => setState(() => subjects.removeAt(index)),
                      child: const Icon(
                        Icons.remove_circle_outline,
                        color: Colors.red,
                        size: 20,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: TextField(
                      controller: subjects[index]['name'],
                      decoration: InputDecoration(
                        hintText: 'Subject name',
                        hintStyle: const TextStyle(fontSize: 12),
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 2,
                    child: TextField(
                      controller: subjects[index]['credits'],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Credits',
                        hintStyle: const TextStyle(fontSize: 12),
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<double>(
                    value: subjects[index]['gradeValue'] as double,
                    isExpanded: true,
                    items: gradeOptions.map((g) {
                      return DropdownMenuItem<double>(
                        value: g['value'] as double,
                        child: Text(
                          g['label'],
                          style: const TextStyle(fontSize: 13),
                        ),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        subjects[index]['gradeValue'] = val!;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCGPAInputs() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: semesters.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 6),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Semester ${index + 1}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1565C0),
                    ),
                  ),
                  const Spacer(),
                  if (semesters.length > 1)
                    GestureDetector(
                      onTap: () => setState(() => semesters.removeAt(index)),
                      child: const Icon(
                        Icons.remove_circle_outline,
                        color: Colors.red,
                        size: 20,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: semesters[index]['sgpa'],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'SGPA (e.g. 8.5)',
                        hintStyle: const TextStyle(fontSize: 12),
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: semesters[index]['credits'],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Total Credits',
                        hintStyle: const TextStyle(fontSize: 12),
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
