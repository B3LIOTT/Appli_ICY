import 'package:app_icy/Objects/Sections.dart';
import 'package:app_icy/home/widgets/CoursWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CoursRepo {
  FirebaseFirestore db = FirebaseFirestore.instance;
  List<CoursWidget> widget_list = <CoursWidget>[];

  CoursRepo(){
    initDB();
  }

  Future<void> initDB()  async {
    db.collection('Sections').get().then((snapshot) =>
        snapshot.docs.forEach((element) {
          var dataList = element.data().values.toList();
          widget_list.add(CoursWidget(Section(dataList[3], dataList[1], dataList[2], dataList[0])));
          })
    );
  }

  List<CoursWidget> get ListCoursWidget {
    return widget_list;
  }
}