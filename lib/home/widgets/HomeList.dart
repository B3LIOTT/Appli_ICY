import 'package:app_icy/Objects/ProviderSearch.dart';
import 'package:app_icy/home/widgets/CoursWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


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

    for (CoursWidget cw in lCw) {
      if (cw.s.Matiere.toLowerCase().contains(word.toLowerCase()) ||
          cw.s.Module.toLowerCase().contains(word.toLowerCase())) {
        _l_display.add(cw);
      }
    }
    return _l_display;
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
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
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