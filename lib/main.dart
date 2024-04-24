import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todolist/firebase_options.dart';
import 'package:todolist/home_view.dart';
import 'package:todolist/login_view.dart';
import 'package:todolist/signup_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const Home(),
        '/Sign': (context) => Signup(),
        '/Login': (context) => const Login(),
      },
    );
  }
}
