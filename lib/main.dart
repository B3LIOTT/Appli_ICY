import 'package:app_icy/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
    SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
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