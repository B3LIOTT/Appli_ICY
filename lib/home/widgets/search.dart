import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Objects/ProviderSearch.dart';
import '../../Objects/Sections.dart';
import 'CoursWidget.dart';

class SearchSection extends StatefulWidget {
  const SearchSection({super.key});

  @override
  _SearchSectionStatement createState() => _SearchSectionStatement();

}

class _SearchSectionStatement extends State<SearchSection>{
  final TextEditingController textFieldController = TextEditingController();
  String textFieldText = "";

  List<CoursWidget> _l_cw = <CoursWidget>[];
  List<CoursWidget> _l_display = <CoursWidget>[];
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  initState() {
    initDB();
    super.initState();
  }

  // Fonction qui initialise la liste de départ
  Future<void> initDB()  async {
    db.collection('Sections').get().then((snapshot) =>
        snapshot.docs.forEach((element) {
          var dataList = element.data().values.toList();
          _l_cw.add(CoursWidget(Section(dataList[3], dataList[1], dataList[2], dataList[0])));
        })
    );
    _l_display = _l_cw;
  }

  // Fonction qui actualise la liste des CoursWidget de l'on va afficher en rapport au mot clé recherché
  void searchAction() {
    textFieldText = textFieldController.text;
    _l_display = <CoursWidget>[];
    for (CoursWidget cw in _l_cw) {
      if (cw.s.Matiere.toLowerCase().contains(textFieldText.toLowerCase()) ||
          cw.s.Module.toLowerCase().contains(textFieldText.toLowerCase())) {
        _l_display.add(cw);
      }
    }if(_l_display.isEmpty){
      // Message d'erreur
    }
    
    var settings = context.read<ProviderSearch>();
    settings.updateList(_l_display);
    textFieldController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: TextField(
                    style: const TextStyle(
                      fontSize: 18,
                      //fontFamily:
                    ),
                    controller: textFieldController,
                    decoration: InputDecoration(
                        isDense: true,
                        fillColor: const Color(0xFFEFEDEF),
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                        hintText: 'CHERCHER UN MOT CLE',
                        hintStyle: TextStyle(
                          color: Colors.grey.withOpacity(0.7),
                          fontSize: 16,
                        )
                      ),
                    ),
                  ),

              ElevatedButton(
                onPressed: searchAction,
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(
                    width: 1,
                    color: Colors.black,
                  ),
                  backgroundColor: const Color(0xFF00516A),
                  shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                      ),
                  minimumSize: const Size(50,50),
                  maximumSize: const Size(50,50),
                ),
                child: const ImageIcon(
                    AssetImage('assets/images/search-interface-symbol.png')
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

}