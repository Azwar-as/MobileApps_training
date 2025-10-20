import 'package:example_stack/layout.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tugas-1',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
          scaffoldBackgroundColor: const Color(0xFFF7F4F6),
          useMaterial3: true,
          fontFamily: 'Poppins'),
      home: const LayoutPages(),
    );
  }
}
