import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'activities/activity_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 🔹 Inicializar Supabase antes de correr la app
  await Supabase.initialize(
    url: 'https://lelcvnzqecyxrprlzzfg.supabase.co', // tu URL
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxlbGN2bnpxZWN5eHJwcmx6emZnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTg3NTI2MjksImV4cCI6MjA3NDMyODYyOX0.vsTg1Q7pRiUWmVKisbpfZSJw-4Xy71VekQlbqqaEbx8', // tu anon key
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EcoTrack',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const ActivityPage(),
    );
  }
}
