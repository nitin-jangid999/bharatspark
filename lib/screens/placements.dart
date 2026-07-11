import 'package:flutter/material.dart';
import 'widgets.dart';

class PlacementsScreen extends StatefulWidget {
  const PlacementsScreen({super.key});
  @override
  State<PlacementsScreen> createState() => _PlacementsScreenState();
}

class _PlacementsScreenState extends State<PlacementsScreen> {
  int _selectedTab = 0;

  final List<Map<String, dynamic>> _jobs = [
    {
      'company': 'TCS',
      'role': 'Software Engineer',
      'package': '3.5 LPA',
      'location': 'Jaipur / Pune',
      'type': 'Full Time',
      'deadline': 'Jul 20, 2026',
      'color': const Color(0xFF1565C0),
      'logo': 'T',
      'skills': ['Java', 'SQL', 'Communication'],
    },
    {
      'company': 'Infosys',
      'role': 'Systems Engineer',
      'package': '3.6 LPA',
      'location': 'Bangalore',
      'type': 'Full Time',
      'deadline': 'Jul 25, 2026',
      'color': const Color(0xFF138808),
      'logo': 'I',
      'skills': ['Python', 'DBMS', 'Aptitude'],
    },
    {
      'company': 'Wipro',
      'role': 'Project Engineer',
      'package': '3.5 LPA',
      'location': 'Multiple Cities',
      'type': 'Full Time',
      'deadline': 'Aug 1, 2026',
      'color': const Color(0xFF6A1B9A),
      'logo': 'W',
      'skills': ['C++', 'OOP', 'Logical Reasoning'],
    },
    {
      'company': 'Amazon',
      'role': 'SDE Intern',
      'package': '60K/month',
      'location': 'Hyderabad',
      'type': 'Internship',
      'deadline': 'Jul 15, 2026',
      'color': const Color(0xFFFF9933),
      'logo': 'A',
      'skills': ['DSA', 'System Design', 'Problem Solving'],
    },
    {
      'company': 'Jaipur Startups',
      'role': 'Flutter Developer',
      'package': '15K/month',
      'location': 'Jaipur',
      'type': 'Internship',
      'deadline': 'Jul 30, 2026',
      'color': const Color(0xFF00695C),
      'logo': 'J',
      'skills': ['Flutter', 'Dart', 'Firebase'],
    },
  ];

  final List<Map<String, dynamic>> _resources = [
    {
      'title': 'Aptitude Preparation',
      'desc': 'Quantitative, Logical, Verbal',
      'icon': Icons.psychology,
      'color': const Color(0xFF1565C0),
    },
    {
      'title': 'DSA Sheet',
      'desc': 'Top 150 coding questions',
      'icon': Icons.code,
      'color': const Color(0xFF138808),
    },
    {
      'title': 'Resume Templates',
      'desc': 'ATS friendly formats',
      'icon': Icons.description,
      'color': const Color(0xFFFF9933),
    },
    {
      'title': 'Interview Tips',
      'desc': 'HR & Technical rounds',
      'icon': Icons.record_voice_over,
      'color': const Color(0xFF6A1B9A),
    },
    {
      'title': 'Company Profiles',
      'desc': 'TCS, Infosys, Wipro & more',
      'icon': Icons.business,
      'color': const Color(0xFF00695C),
    },
    {
      'title': 'Mock Tests',
      'desc': 'Practice placement tests',
      'icon': Icons.quiz,
      'color': const Color(0xFFFF6B00),
    },
  ];

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
              colors: [Color(0xFF00695C), Color(0xFF004D40)],
            ),
          ),
        ),
        title: const Text(
          '💼 Placements',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          const TricolorStrip(),

          // Stats
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            color: const Color(0xFF00695C).withOpacity(0.08),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _StatItem('🏢', '50+', 'Companies'),
                _StatItem('💰', '3.5-12', 'LPA Range'),
                _StatItem('✅', '200+', 'Placed 2025'),
              ],
            ),
          ),

          // Tab bar
          Container(
            color: Colors.white,
            child: Row(
              children: [
                _TabButton('Job Openings', 0),
                _TabButton('Resources', 1),
              ],
            ),
          ),

          Expanded(
            child: _selectedTab == 0 ? _buildJobsList() : _buildResourcesList(),
          ),
        ],
      ),
    );
  }

  Widget _buildJobsList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _jobs.length,
      itemBuilder: (context, index) {
        final job = _jobs[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 46,
                      height: 46,
                      decoration: BoxDecoration(
                        color: job['color'],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          job['logo'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            job['company'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            job['role'],
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: job['type'] == 'Internship'
                            ? const Color(0xFFFF9933).withOpacity(0.1)
                            : const Color(0xFF138808).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        job['type'],
                        style: TextStyle(
                          color: job['type'] == 'Internship'
                              ? const Color(0xFFFF9933)
                              : const Color(0xFF138808),
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _InfoChip(
                      Icons.currency_rupee,
                      job['package'],
                      const Color(0xFF138808),
                    ),
                    const SizedBox(width: 8),
                    _InfoChip(
                      Icons.location_on_outlined,
                      job['location'],
                      const Color(0xFF1565C0),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 6,
                  children: (job['skills'] as List<String>).map((skill) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0F4FF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        skill,
                        style: const TextStyle(
                          fontSize: 11,
                          color: Color(0xFF000080),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(
                      Icons.timer_outlined,
                      size: 14,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Deadline: ${job['deadline']}',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              job['color'] as Color,
                              (job['color'] as Color).withOpacity(0.7),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'Apply Now',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildResourcesList() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.2,
      ),
      itemCount: _resources.length,
      itemBuilder: (context, index) {
        final res = _resources[index];
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: (res['color'] as Color).withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    res['icon'] as IconData,
                    color: res['color'] as Color,
                    size: 28,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  res['title'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  res['desc'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _TabButton(String label, int index) {
    final selected = _selectedTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedTab = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: selected ? const Color(0xFF00695C) : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: selected ? const Color(0xFF00695C) : Colors.grey,
              fontWeight: selected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  Widget _StatItem(String emoji, String value, String label) {
    return Column(
      children: [
        Text(emoji, style: const TextStyle(fontSize: 20)),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Color(0xFF00695C),
          ),
        ),
        Text(label, style: const TextStyle(fontSize: 11, color: Colors.grey)),
      ],
    );
  }

  Widget _InfoChip(IconData icon, String label, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: color),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: color,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
