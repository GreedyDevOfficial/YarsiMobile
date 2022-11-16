import 'package:flutter/material.dart';
import 'package:yarsi/config/palette.dart';
import 'package:yarsi/config/size_config.dart';

import 'components/adv_favorites_list.dart';

class FavoritesScreen extends StatefulWidget {
  static String routeName = "/favorites";

  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> with TickerProviderStateMixin {


  late TabController _tabController;
  int _selectedIndex = 0;


  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: _tabs.length, vsync: this, initialIndex: 0);
    _tabController.animateTo(0);
  }

  static const List<Tab> _tabs = [Tab(text: 'بازاریابی',), Tab(text: 'تبلیغاتی',)];

  static  List<Widget> _views = [
    AdvFavoritesList(),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final Size size = MediaQuery.of(context).size;
    return ListView(children: [
      DefaultTabController(
          length: 1,
          initialIndex: 0,
          child: Column(
            children: [
              SizedBox(height: 10.0,),
              Text('علاقمندی ها', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800, color: Palette.primaryDarkColor),),
              SizedBox(height: 10.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 65.0),
                child: Container(
                  decoration: BoxDecoration(
                    color:
                    Palette.primaryLightColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: TabBar(
                    onTap: (index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    //controller: _tabController,
                    indicator: BoxDecoration(
                        color: Palette.primaryDarkColor,
                        borderRadius:
                        BorderRadius.circular(25.0)),
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: 'IRANSans'),
                    unselectedLabelColor: Colors.black,
                    labelColor: Colors.white,
                    tabs: [
                      Tab(
                        text: 'تبلیغاتی و بازاریابی',
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  height: size.height, // TODO: How to not require static height
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
                    child: IndexedStack(
                      index: _selectedIndex,
                      children: _views,
                    ),
                  )
              )
            ],
          ))
    ]);
  }
}

