import 'package:flutter/material.dart';
import 'Screens/login.dart';
import 'Screens/signup.dart';
import 'package:libroloom/Screens/dashboard.dart';
import 'Screens/upload.dart';

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
        '/dashboard': (context) => const Dashboard(),
        '/upload': (context) => const Upload(),
      },
      theme: ThemeData.dark(),
    );
  }
}
