import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'theme.dart'; // Importamos el nuevo archivo de tema

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DigiSkills',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme, // Usamos nuestro tema personalizado
      home: const HomeScreen(),
    );
  }
}