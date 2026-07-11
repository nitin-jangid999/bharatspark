import 'package:flutter/material.dart';
import 'widgets.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});
  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  int _expandedIndex = -1;

  final List<Map<String, String>> _faqs = [
    {
      'q': 'BharatSpark kya hai?',
      'a':
          'BharatSpark ek college super app hai jo SKIT Jaipur ke students ke liye banaya gaya hai. Isme notes, PYQ papers, timetable, CGPA calculator, AI doubt solver aur bahut kuch hai!',
    },
    {
      'q': 'Notes kaise download karein?',
      'a':
          'Home screen pe Notes card pe tap karein, apni branch aur semester select karein, phir download icon pe tap karein!',
    },
    {
      'q': 'AI Doubt Solver kaise use karein?',
      'a':
          'Home screen pe AI Doubt Solver pe tap karein, apna question type karein aur send karein. Gemini AI turant jawab dega!',
    },
    {
      'q': 'CGPA Calculator kaise use karein?',
      'a':
          'CGPA Calc screen pe SGPA ya CGPA mode choose karein, subjects aur credits daalo, grade select karein aur Calculate button dabao!',
    },
    {
      'q': 'Community mein question kaise poochein?',
      'a':
          'Community screen pe jaayein, neeche "Ask Question" button pe tap karein, apna doubt likhein aur Post karein!',
    },
    {
      'q': 'App mein apna data kaise update karein?',
      'a':
          'Profile screen pe jaayein aur apni details update karein. Abhi yeh feature coming soon hai!',
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
              colors: [Color(0xFF1565C0), Color(0xFF0D47A1)],
            ),
          ),
        ),
        title: const Text(
          '🆘 Help & Support',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TricolorStrip(),

            // Header card
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1565C0), Color(0xFF0D47A1)],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                children: [
                  Icon(Icons.support_agent, color: Colors.white, size: 48),
                  SizedBox(height: 10),
                  Text(
                    'Hum Yahan Hain! 🙏',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Koi bhi problem ho — hum solve karenge!',
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                ],
              ),
            ),

            // Contact options
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: _ContactCard(
                      icon: Icons.email_outlined,
                      label: 'Email Us',
                      value: 'support@\nbharatspark.in',
                      color: const Color(0xFFFF9933),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _ContactCard(
                      icon: Icons.chat_outlined,
                      label: 'WhatsApp',
                      value: 'Chat with\nus now',
                      color: const Color(0xFF138808),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _ContactCard(
                      icon: Icons.bug_report_outlined,
                      label: 'Report Bug',
                      value: 'Found an\nissue?',
                      color: const Color(0xFF6A1B9A),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // FAQ section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    '❓ Frequently Asked Questions',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0D0D2B),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // FAQ list
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _faqs.length,
              itemBuilder: (context, index) {
                final isExpanded = _expandedIndex == index;
                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: ExpansionTile(
                    initiallyExpanded: false,
                    onExpansionChanged: (expanded) {
                      setState(() {
                        _expandedIndex = expanded ? index : -1;
                      });
                    },
                    leading: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1565C0).withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.question_mark,
                        color: Color(0xFF1565C0),
                        size: 16,
                      ),
                    ),
                    title: Text(
                      _faqs[index]['q']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Color(0xFF222222),
                      ),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: Text(
                          _faqs[index]['a']!,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            // Dhan Nirankar Ji
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF0D0D2B), Color(0xFF000080)],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Row(
                children: [
                  Text('🙏', style: TextStyle(fontSize: 28)),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dhan Nirankar Ji',
                          style: TextStyle(
                            color: Color(0xFFFF9933),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Nirankar ki Kripa se aage badhte rahein! 🔥',
                          style: TextStyle(color: Colors.white70, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // App version
            const Text(
              'BharatSpark v1.0.0 — Made with ❤️ for SKIT Jaipur',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class _ContactCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _ContactCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 6),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 22),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 10, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
