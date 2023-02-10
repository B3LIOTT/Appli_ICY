import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
          height: 120,
          padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10, right: 10),
          decoration: const BoxDecoration(
            color: Color(0xFFEFEDEF),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 140,
                child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_s.Matiere,
                      style: const TextStyle(
                      fontSize: 18,
                    )
                  ),
                  Text("Periode: ${_s.Periode.toString()}",
                      style: const TextStyle(
                        color: Colors.black45,
                        fontSize: 14,
                      )
                  ),
                  Text("Module: ${_s.Module}",
                      style: const TextStyle(
                        color: Colors.black45,
                        fontSize: 14,
                      )
                  )
                ],
              ),
              ),
              Expanded(
                  child: Image.network(_s.ImageUrl)
              )
            ],
          ),
        ),
      ),
    );
  }
}