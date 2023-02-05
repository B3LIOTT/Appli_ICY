import 'package:app_icy/Objects/CoursRepo.dart';
import 'package:app_icy/home/widgets/CoursWidget.dart';
import 'package:app_icy/home/widgets/HomeList.dart';
import 'package:app_icy/home/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Objects/ProviderSearch.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProviderSearch()),
        StreamProvider<List<CoursWidget>>.value(
            value: CoursRepo().ListCoursWidget,
            initialData: []
        )
      ],
      child: Scaffold(
        backgroundColor: const Color(0xFF5198C3),
        body:Column(
              children: [
                Image.asset(
                    'assets/images/TOP_DESIGN_ICY_APP.png'
                ),
                const SearchSection(),
                const Expanded(child: HomeList())
              ],
            ),
        bottomNavigationBar: NavigationBar(),
      )
    );
  }

  Widget NavigationBar() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 10),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          selectedItemColor: const Color(0xFF00516A),
          selectedFontSize: 12,
          unselectedFontSize: 12,
          unselectedItemColor: Colors.grey.withOpacity(0.7),
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              label: 'HOME',
              icon: ImageIcon(AssetImage('assets/images/house.png')),
            ),
            BottomNavigationBarItem(
              label: 'MENU',
              icon:  ImageIcon(AssetImage('assets/images/more.png')),
            ),
            BottomNavigationBarItem(
              label: 'CONTACT',
              icon:  ImageIcon(AssetImage('assets/images/letter.png')),
            ),
          ],

        ),
      ),
    );
  }
}