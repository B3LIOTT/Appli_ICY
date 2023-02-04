import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Objects/Sections.dart';

class CoursInfo extends StatelessWidget {
  Section? _s;
  late Future<ListResult> data;

  CoursInfo(Section s, {super.key}) {
    _s = s;
    data = FirebaseStorage.instance.ref("${_s?.Matiere}/").list();// On récupère les fichiers associés à la matière choisie
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5198C3),
      appBar: AppBar(
        backgroundColor: const Color(0xFF00516A),
        title: const Text("Fichiers de cours"),
      ),
        body: FutureBuilder<ListResult>(
          future: data,
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              final files = snapshot.data!.items;
              return ListView.builder(
                itemCount: files.length,
                itemBuilder: (context, index) {
                  final file = files[index];
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        height: 80,
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: Color(0xFFEFEDEF),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset('assets/images/file.png'),
                            Expanded(
                                child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Text(file.name,
                                        style: const TextStyle(
                                          fontSize: 20,
                                        )
                                    ),
                                ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );

            }else if (snapshot.hasError) {
              return const Center(child: Text("Error")
              );
            }else {
              return const Center(child: CircularProgressIndicator(),);
            }
          }
        ),
    );
  }

}