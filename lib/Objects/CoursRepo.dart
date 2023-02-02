
import 'package:app_icy/Objects/Sections.dart';

class CoursRepo {

  List<Section> section_list = <Section>[];

  CoursRepo(){
    for(int i = 0; i < 10; i++){
      section_list.add(Section(i%4 + 1, "Module", "Matiere", ""));
    }
  }
}