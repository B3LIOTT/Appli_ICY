
class Section {
  final int _periode;
  final String _module;
  final String _matiere;
  final String _imageUrl;

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