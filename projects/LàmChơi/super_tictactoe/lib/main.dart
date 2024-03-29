import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/features/auth/screens/login_screen.dart';
import 'package:todo_app/features/auth/screens/register_screen.dart';
import 'package:todo_app/features/home/screens/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyC6qB8YbUoTTSxso9HjW1CZiqcOpHYEQ14',
      appId: '1:1023739173542:android:38ce7048a85c6cefa47267',
      messagingSenderId: '1023739173542',
      projectId: 'messenger-7a021'
    ),
  );
  runApp(const MessengerApp());
}

class MessengerApp extends StatefulWidget {
  const MessengerApp({super.key});

  @override
  State<MessengerApp> createState() => _MessengerAppState();
}

class _MessengerAppState extends State<MessengerApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => SigningScreen(),
        '/signup': (context) => SignUpScreen(),
        '/home': (context) => HomeScreen(),
      },
      debugShowCheckedModeBanner: false,
      // home: SigningScreen(),
    );
  }
}
