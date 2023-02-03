import 'package:app_icy/Objects/CoursRepo.dart';
import 'package:app_icy/home/widgets/CoursWidget.dart';
import 'package:flutter/material.dart';

class HomeList extends StatefulWidget {
  const HomeList({super.key});

   @override
  _HomeListStatement createState() => _HomeListStatement();
}

class _HomeListStatement extends State<HomeList>{

  List<CoursWidget> l_cw = CoursRepo().ListCoursWidget;
  List<CoursWidget> l_display = <CoursWidget>[];

  // Fonction qui met à jour la liste des CoursWidget de l'on va afficher en rapport au mot clé recherché
  void updateList(String word) {
    for(CoursWidget cw in l_cw ){
      if( word == cw.s.Matiere) {
        l_display.add(cw);
      }
      else if(cw.s.Module.contains(word)) {
        l_display.add(cw);
      }
      else if(cw.s.Periode == int.parse(word)) {
        l_display.add(cw);
      }
    }
  }

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
        child: ListView.builder(
            itemBuilder:
        ),
      )
    );
  }

}