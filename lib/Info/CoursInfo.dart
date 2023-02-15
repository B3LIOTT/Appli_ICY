import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import '../Objects/Sections.dart';
import 'dart:io';

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
      backgroundColor: Color(0xFF5198C3),
        body: Column(
          children: [
            Image.asset(
                'assets/images/APP_ICY_DESIGN_FILES.png'
            ),
            Expanded(
                child: FutureBuilder<ListResult>(
                  future: data,
                  builder: (context, snapshot) {
                    if(snapshot.hasData) {
                      final files = snapshot.data!.items;
                      return ListView.builder(
                        itemCount: files.length,
                        itemBuilder: (context, index) {
                          final file = files[index];// = path reference to the pdf
                          return Padding(
                            padding: const EdgeInsets.all(15),
                            child: Container(
                              height: 80,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: const Color(0xFFEFEDEF),
                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                                border: Border.all(
                                    color: Colors.black,
                                    width: 1
                                ),
                              ),
                              child: InkWell(
                              onTap: () async {
                                try{
                                  final appDocDir = await getApplicationDocumentsDirectory();
                                  final filePath = "${appDocDir.path}/${file.name}";
                                  final dlFile = File(filePath);

                                  final downloadTask = file.writeToFile(dlFile);
                                  downloadTask.snapshotEvents.listen((taskSnapshot) {
                                    if(taskSnapshot.state == TaskState.error) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(content: Text(
                                              "Erreur de téléchargement",
                                        style: TextStyle(
                                          color: Colors.red,
                                        ),
                                          ),
                                          ),
                                      );
                                    }else if(taskSnapshot.state == TaskState.success) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(content: Text(
                                              "Téléchargement terminé",
                                            style: TextStyle(
                                              color: Colors.green,
                                            ),
                                          ),
                                          ),
                                      );
                                    }
                                  });

                                  await dlFile.create();
                                  await OpenFile.open(dlFile.path);
                                  await dlFile.delete();

                                }on FirebaseException catch(e) {
                                  //
                                }
                              },
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
            ),
          ],
      ),
    );
  }

}