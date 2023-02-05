import 'package:app_icy/home/widgets/CoursWidget.dart';
import 'package:flutter/cupertino.dart';

class ProviderSearch extends ChangeNotifier {
  String _word = "";

  void updateKeyWord(String word) {
    _word = word;
    notifyListeners();
  }


  String get keyWord {
    return _word;
  }

}