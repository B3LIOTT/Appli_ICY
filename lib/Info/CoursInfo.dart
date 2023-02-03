import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Objects/Sections.dart';

class CoursInfo extends StatelessWidget {
  Section _s;

  CoursInfo(this._s, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00516A),
      body: Column(
        children: const [
          SizedBox(height: 100,),
          Text("PAGE D'INFOS", style: TextStyle(fontSize: 32),)
        ],
      ),
    );
  }

}