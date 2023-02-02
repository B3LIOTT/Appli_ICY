
class Section {
  int _periode = 0;
  String _module = "";
  String _matiere = "";
  String _imageUrl = "";

  Section(this._periode, this._module, this._matiere, this._imageUrl);

  int get Periode {
    return _periode;
  }
  String get Matiere {
    return _matiere;
  }
  String get Module {
    return _module;
  }
  String get ImageUrl {
    return _imageUrl;
  }
}