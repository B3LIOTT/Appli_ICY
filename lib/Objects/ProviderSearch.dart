import 'package:app_icy/home/widgets/CoursWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'Sections.dart';

class ProviderSearch extends ChangeNotifier {
  List<CoursWidget> _l_display = <CoursWidget>[];

  void updateList(List<CoursWidget> l_display) {
    _l_display = l_display;
    notifyListeners();
  }

  List<CoursWidget> get ListCoursWidget {
      return _l_display;
  }

}