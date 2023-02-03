import 'package:flutter/material.dart';

import '../../Objects/Sections.dart';

class CoursWidget extends StatelessWidget {
  Section _s;

  CoursWidget(this._s, {super.key});

  Section get s {
    return _s;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Color(0xFFEFEDEF),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Row(
          children: [
            Column(
              children: [
                Text(_s.Matiere)
              ],
            )
          ],
        ),
      ),
    );
  }
}