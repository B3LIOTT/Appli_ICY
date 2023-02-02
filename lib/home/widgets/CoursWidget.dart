import 'package:flutter/material.dart';

class CoursWidget extends StatelessWidget {
  String matiere = "";
  int periode = 0;

  CoursWidget(String matiere, int periode, {super.key}){
    this.matiere = matiere;
    this.periode = periode;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 100,
        decoration: const BoxDecoration(
          color: Color(0xFFEFEDEF),
          borderRadius: BorderRadius.all(Radius.circular(15))
        ),
        child: Row(
          children: [
            Column(
              children: [
                Text(matiere)
              ],
            )
          ],
        ),
      ),
    );
  }
}