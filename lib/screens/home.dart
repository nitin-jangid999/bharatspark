import 'package:flutter/material.dart';
import 'notes.dart';
import 'pyq.dart';
import 'timetable.dart';
import 'widgets.dart';
import 'cgpa.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFF9933), Color(0xFFFF6B00)],
            ),
          ),
        ),
        title: Row(
          children: const [
            Icon(Icons.bolt, color: Colors.white, size: 28),
            SizedBox(width: 8),
            Text(
              'BharatSpark',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(height: 5, color: const Color(0xFFFF9933)),
              ),
              Expanded(
                child: Container(height: 5, color: const Color(0xFFFFFFFF)),
              ),
              Expanded(
                child: Container(height: 5, color: const Color(0xFF138808)),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFFF9933), Color(0xFFFF6B00)],
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jai Hind! 🇮🇳',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'SKIT Jaipur — BharatSpark',
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Explore',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF222222),
                    ),
                  ),
                  const SizedBox(height: 12),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    children: [
                      FeatureCard(
                        icon: Icons.menu_book,
                        label: 'Notes',
                        color: const Color(0xFFFF9933),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const NotesScreen(),
                          ),
                        ),
                      ),
                      FeatureCard(
                        icon: Icons.description_outlined,
                        label: 'PYQ Papers',
                        color: const Color(0xFF138808),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const PYQScreen()),
                        ),
                      ),
                      FeatureCard(
                        icon: Icons.smart_toy_outlined,
                        label: 'AI Doubt Solver',
                        color: const Color(0xFF000080),
                        onTap: () {},
                      ),
                      FeatureCard(
                        icon: Icons.calendar_today_outlined,
                        label: 'Timetable',
                        color: const Color(0xFFFF6B00),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const TimetableScreen(),
                          ),
                        ),
                      ),
                      FeatureCard(
                        icon: Icons.calculate_outlined,
                        label: 'CGPA Calc',
                        color: const Color(0xFF1565C0),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const CGPAScreen()),
                        ),
                      ),
                      FeatureCard(
                        icon: Icons.forum_outlined,
                        label: 'Community',
                        color: const Color(0xFF138808),
                        onTap: () {},
                      ),
                      FeatureCard(
                        icon: Icons.work_outline,
                        label: 'Placements',
                        color: const Color(0xFF000080),
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFFFF9933),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
