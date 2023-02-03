
import 'package:app_icy/Objects/Sections.dart';
import 'package:app_icy/home/widgets/CoursWidget.dart';

class CoursRepo {

  List<CoursWidget> widget_list = <CoursWidget>[];

  CoursRepo(){
    widget_list.add(CoursWidget(Section(1, "testmodule", "testmatiere", "assets/images/image.png")));
    for(int i = 0; i < 10; i++){
      widget_list.add(CoursWidget(Section(i%4 + 1, "Module", "Matiere", "assets/images/image.png")));
    }
  }

  List<CoursWidget> get ListCoursWidget {
    return widget_list;
  }
}