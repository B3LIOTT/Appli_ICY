import 'package:flutter/material.dart';

class SearchSection extends StatefulWidget {
  const SearchSection({super.key});

  @override
  _SearchSectionSatement createState() => _SearchSectionSatement();

}

class _SearchSectionSatement extends State<SearchSection>{
  final TextEditingController textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: [
          Container(
            height:50,
            width: 250,//à changer: il faut faire une taille relative à celle de l'écran
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            child: TextField(
              style: const TextStyle(
                fontSize: 18,
                //fontFamily:
              ),
              controller: textFieldController,
              decoration: InputDecoration(
                  fillColor: const Color(0xFFEFEDEF),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none
                      )
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
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xFFEFEDEF)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                  )
              ),
              minimumSize: MaterialStateProperty.all(Size(50,50)),
              maximumSize: MaterialStateProperty.all(Size(50,50)),
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
  }

}