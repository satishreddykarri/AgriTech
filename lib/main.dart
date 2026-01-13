import 'package:flutter/material.dart';
import 'dashboard_screen.dart';

void main() {
  runApp(const AgriTechApp());
}

class AgriTechApp extends StatelessWidget {
  const AgriTechApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AgriTech Dashboard',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF9FAFB),
        fontFamily: 'Inter',
      ),
      home: const DashboardScreen(),
    );
  }
}
