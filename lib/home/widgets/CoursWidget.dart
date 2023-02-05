import 'package:flutter/material.dart';
import '../../Info/CoursInfo.dart';
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
      child: InkWell(
        onTap: (){
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => CoursInfo(_s)
            ),
          );
        },
        child: Container(
          height: 100,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Color(0xFFEFEDEF),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_s.Matiere,
                      style: const TextStyle(
                      fontSize: 18,
                    )
                  ),
                  Text(_s.Module,
                      style: const TextStyle(
                        fontSize: 14,
                      )
                  )
                ],
              ),
              //Image.asset(_s.ImageUrl)
            ],
          ),
        ),
      ),
    );
  }
}