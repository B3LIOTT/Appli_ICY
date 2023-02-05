import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Objects/ProviderSearch.dart';

class SearchSection extends StatefulWidget {
  const SearchSection({super.key});

  @override
  _SearchSectionStatement createState() => _SearchSectionStatement();

}

class _SearchSectionStatement extends State<SearchSection>{
  final TextEditingController textFieldController = TextEditingController();
  String textFieldText = "";

  // Fonction qui actualise la liste des CoursWidget de l'on va afficher en rapport au mot clé recherché
  void searchAction() {
    var settings = context.read<ProviderSearch>();
    settings.updateKeyWord(textFieldController.text.trim());
    textFieldController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.7,
              child: TextField(
                cursorColor: Colors.black,
                style: const TextStyle(
                  fontSize: 18,
                  //fontFamily:
                ),
                controller: textFieldController,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 15, bottom: 0),
                    isDense: false,
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
    );
  }

}