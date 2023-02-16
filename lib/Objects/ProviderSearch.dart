import 'package:flutter/cupertino.dart';

class ProviderSearch extends ChangeNotifier {
  String _word = "";
  String _filterPeriode ="all";
  String _filterModule = "all";

  void updateKeyWord(String word) {
    _word = word;
    notifyListeners();
  }
  void updateFilters(String filterPeriode, String filterModule) {
    _filterPeriode = filterPeriode;
    _filterModule = filterModule;
    notifyListeners();
  }

  String get keyWord {
    return _word;
  }
  String get filterPeriode {
    return _filterPeriode;
  }
  String get filterModule {
    return _filterModule;
  }

}