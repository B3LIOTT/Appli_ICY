import 'package:app_icy/firebase_options.dart';
import 'package:app_icy/home/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const IcyApp());
}

class IcyApp extends StatelessWidget {
  const IcyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'IcyApp',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }

}