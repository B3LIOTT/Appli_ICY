import 'package:app_icy/home/widgets/CoursWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  List<CoursWidget> filter(List<CoursWidget> lcw, String filter) {
    List<CoursWidget> _l_display = <CoursWidget>[];



    return _l_display;
  }

  @override
  Widget build(BuildContext context) {
    final _cours = Provider.of<List<CoursWidget>>(context);
    return const Placeholder();
  }
}
