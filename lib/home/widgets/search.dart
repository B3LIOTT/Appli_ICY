import 'package:flutter/material.dart';

class SearchSection extends StatefulWidget {
  const SearchSection({super.key});

  @override
  _SearchSectionStatement createState() => _SearchSectionStatement();

}

class _SearchSectionStatement extends State<SearchSection>{
  final TextEditingController textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                fontSize: 15,
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

  void searchAction() {
    textFieldController.clear();

    //Recherche des éléments en rapport avec le mot clé
  }

}