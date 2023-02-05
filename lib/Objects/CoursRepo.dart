import 'package:app_icy/Objects/Sections.dart';
import 'package:app_icy/home/widgets/CoursWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CoursRepo {
  final CollectionReference _cours = FirebaseFirestore.instance.collection('Sections');

  // Recuperation des données
  Stream<List<CoursWidget>> get ListCoursWidget {
    return _cours.snapshots().map((snapshot){
      return snapshot.docs.map((element){
        return CoursWidget(Section(element.get('periode'),
            element.get('module'),
            element.get('matiere'),
            element.get('imgUrl')));
      }).toList();
    });
  }
}