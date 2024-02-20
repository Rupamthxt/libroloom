import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:libroloom/firebase_options.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  'LibroLoom',
                style: TextStyle(
                  fontSize: 80.0,
                  fontFamily: 'ProtestRiot'
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Enter email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0)
                  )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: 'Enter password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0)
                  )
                ),
              ),
            ),
            TextButton(
                onPressed: login,
              style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith((states) => Colors.deepPurple)
              ),
                child: const Text('Login'),
            ),
            TextButton(onPressed: () => Navigator.pushNamed(context, '/signup'),
                child: const Text('Sign Up')
            )
          ],
        ),
      ),
    );
  }

  void checkLog() async{
    late final FirebaseApp app;
    app = await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    if(FirebaseAuth.instance.currentUser != null) {
      Navigator.pushNamed(context, '/dashboard');
    }
  }

  void login() async{
    late final FirebaseApp app;
    late final FirebaseAuth auth;
    app = await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    auth = FirebaseAuth.instanceFor(app: app);

    FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text)
        .then((value) => {
          Navigator.pushNamed(context, '/dashboard'),
    }).catchError((err)=>print(err.code)
    // TODO: Add error handling
        );
  }
}
