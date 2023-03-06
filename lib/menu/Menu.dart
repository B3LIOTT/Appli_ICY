import 'package:app_icy/home/widgets/CoursWidget.dart';
import 'package:app_icy/home/widgets/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  final TextEditingController textFieldController = TextEditingController();

  List<CoursWidget> filter(List<CoursWidget> lcw, String filter) {
    List<CoursWidget> _l_display = <CoursWidget>[];



    return _l_display;
  }

  @override
  Widget build(BuildContext context) {
    final _cours = Provider.of<List<CoursWidget>>(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            backgroundColor: Color(0xFF00516A),
            centerTitle: true,
            title: Text('Menu'),
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image(
                image: AssetImage('assets/images/TOP_DESIGN_ICY_APP.png'),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Padding(
                        padding: const EdgeInsets.only(right: 15, left: 15),
                        child: _cours[index],
                    );
                  },
              childCount: _cours.length,
            ),
          ),
        ],
      ),
    );
  }
}
