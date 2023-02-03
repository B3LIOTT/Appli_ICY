import 'package:app_icy/home/widgets/CoursWidget.dart';
import 'package:flutter/material.dart';

class HomeList extends StatefulWidget {
  const HomeList({super.key});

   @override
  _HomeListStatement createState() => _HomeListStatement();
}

class _HomeListStatement extends State<HomeList>{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF00516A),
          borderRadius: const BorderRadius.all(Radius.circular(25)),
          border: Border.all(
            color: Colors.black,
            width: 1
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          children: [
            CoursWidget("Complexité", 1),
            CoursWidget("POO JAVA avancée", 1),
            CoursWidget("Proba Stats", 2),
            CoursWidget("Dev Web", 2),
            CoursWidget("Cryptographie", 3),
          ],
        ),
      )
    );
  }

}