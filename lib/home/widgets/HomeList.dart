import 'package:app_icy/Objects/CoursRepo.dart';
import 'package:app_icy/Objects/ProviderSearch.dart';
import 'package:app_icy/Objects/Sections.dart';
import 'package:app_icy/home/widgets/CoursWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeList extends StatefulWidget {
  const HomeList({super.key});

   @override
  _HomeListStatement createState() => _HomeListStatement();
}

class _HomeListStatement extends State<HomeList>{

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderSearch>(
        builder: (context, settings, child) {
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
                itemCount: settings.ListCoursWidget.length,
                itemBuilder: (context, index) => settings.ListCoursWidget[index],
                padding: const EdgeInsets.all(10),
                ),
              ),
          );
        }
    );
  }

}