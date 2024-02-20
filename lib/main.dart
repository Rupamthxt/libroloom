import 'package:flutter/material.dart';
import 'Screens/login.dart';
import 'Screens/signup.dart';

void main() {
  runApp(const LibroLoom());
}

class LibroLoom extends StatelessWidget {
  const LibroLoom({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/login': (context) => const Login(),
        '/signup': (context) => const Signup(),
      },
      theme: ThemeData.dark(),
    );
  }
}
