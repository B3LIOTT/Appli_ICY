
import 'package:app_icy/Objects/Sections.dart';
import 'package:app_icy/home/widgets/CoursWidget.dart';

class CoursRepo {

  List<CoursWidget> widget_list = <CoursWidget>[];

  CoursRepo(){
    for(int i = 0; i < 10; i++){
      widget_list.add(CoursWidget(Section(i%4 + 1, "Module", "Matiere", "")));
    }
  }

  List<CoursWidget> get ListCoursWidget {
    return widget_list;
  }
}