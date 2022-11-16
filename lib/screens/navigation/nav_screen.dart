import 'package:flutter/material.dart';
import 'package:yarsi/widgets/widgets.dart';


import '../screens.dart';

class NavScreen extends StatefulWidget {

  static String routeName = "/navigation";

  const NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {


  final List<Widget> _screens = [
    ProfileScreen(),
    FavoritesScreen(),
    ExploreScreen(),
    HomeScreen(),
  ];

  int _selectedIndex = 3;
  final List<IconData> _icons = const [
    Icons.person,
    Icons.bookmark,
    Icons.search,
    Icons.home,
  ];

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery
        .of(context)
        .size;
    return DefaultTabController(
      length: _icons.length,
      initialIndex: 3,
      child: Scaffold(
        appBar:  PreferredSize(
          preferredSize: Size(screenSize.width, 100.0),
          child: _selectedIndex != 2
              ? MainAppBar(
            onTap: () =>  {

            },)
              : SearchAppBar(
            onTap: () =>  {

            },),
        ) ,
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        endDrawer: Drawer(
          backgroundColor: Palette.primaryLightBackground,
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  MyDrawerHeader(post: posts[0]),
                  DrawerList(),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: !Responsive.isDesktop(context) ? Container(
          padding: const EdgeInsets.only(bottom: 0.0),
          child: CustomTabBar(
              icons: _icons,
              selectedIndex: _selectedIndex,
              onTap: (index) => setState(() => {
                _selectedIndex = index,
                if (_selectedIndex == 2 && true) {
                  showLocationDialog(context)
                }
              })
          ),
        ) : const SizedBox.shrink(),
      ),
    );
  }
  showLocationDialog(BuildContext context) {
    showDialog(
      builder: (context) => ShowCustomDialog(title: 'تعیین موقعیت شما', type: 'location', height: 200),
      context: context,
      barrierDismissible: true,
    );
  }
}
