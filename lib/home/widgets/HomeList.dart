import 'package:app_icy/Objects/ProviderSearch.dart';
import 'package:app_icy/home/widgets/CoursWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Objects/Sections.dart';


class HomeList extends StatefulWidget {
  const HomeList({super.key});

   @override
  _HomeListStatement createState() => _HomeListStatement();
}

class _HomeListStatement extends State<HomeList>{
  List<CoursWidget> _l_display = <CoursWidget>[];


  // Fonction qui actualise la liste des cours à afficher
  List<CoursWidget> displayList(List<CoursWidget> lCw, String word) {
    _l_display = <CoursWidget>[];

    if(word == "Loutre"){
      List<CoursWidget> easteregg = <CoursWidget>[];
      easteregg.add(CoursWidget(Section(0, "LOUTRE", "Loutre","https://cdn.discordapp.com/attachments/1043102872587477013/1072520825955176508/DALLE_2023-02-07_15.13.32_-_An_oil_painting_of_an_otter_king_in_the_1650s._Regalia._Sceptre._Crown.png")));
      _l_display = easteregg;
      return _l_display;
    }
    else {
      for (CoursWidget cw in lCw) {
        if (cw.s.Matiere.toLowerCase().contains(word.toLowerCase()) ||
            cw.s.Module.toLowerCase().contains(word.toLowerCase())) {
          _l_display.add(cw);
        }
      }
      return _l_display;
    }
  }

  @override
  Widget build(BuildContext context) {
    final _cours = Provider.of<List<CoursWidget>>(context);
    return Consumer<ProviderSearch>(
        builder: (context, settings, child) {
          return ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 800
            ),
            child: Container(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 20),
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
                  itemCount: displayList(_cours, settings.keyWord).length,
                  itemBuilder: (context, index) => _l_display[index],
                  padding: const EdgeInsets.all(10),
                )
            ),
            ),
          );
        },
      );
    }
}