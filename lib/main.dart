import 'package:flutter/material.dart';
import 'package:whatsapp/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatsApp',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        // Add any additional theme configurations here if needed.
      ),
      home: const HomeScreen(),
    );
  }
}


