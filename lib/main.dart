import 'package:flutter/material.dart';
import 'Screens/login.dart';

void main() {
  runApp(const LibroLoom());
}

class LibroLoom extends StatelessWidget {
  const LibroLoom({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login': (context) => const Login(),
      },
    );
  }
}
