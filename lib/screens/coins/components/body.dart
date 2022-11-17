import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:yarsi/config/palette.dart';
import 'package:yarsi/config/size_config.dart';

import 'coin_exchange.dart';
import 'coin_turnover.dart';


class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with TickerProviderStateMixin {

  int selectedIndex = 0;
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: 2);

    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      switch (_tabController.index) {
        case 0:
          {
            print('0');
          }
          break;
        case 1:
          {
            print('1');
          }
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final totalCoins = 150;
    final blockedCoins = 75;
    final availableCoins = 75;
    SizeConfig().init(context);
    final Size size = MediaQuery.of(context).size;
    final ScrollController _scrollController = ScrollController();
    intl.NumberFormat myFormat = intl.NumberFormat.decimalPattern('en_us');
    return DefaultTabController(
      length: 2,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Color(0xFFDA9F2B).withOpacity(0.4),
            automaticallyImplyLeading: false,
            bottom: PreferredSize(
              child: Container(),
              preferredSize: Size(0, 20),
            ),
            pinned: false,
            expandedHeight: MediaQuery.of(context).size.height * 0.35,
            flexibleSpace: Stack(
              children: [
                Positioned(
                  child: Image(
                      image: AssetImage('assets/png/header_design.png'),
                      fit: BoxFit.cover,
                      height: size.height / 3,
                      width: double.infinity,
                      color: Color(0xFF000000).withOpacity(0.05)),
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                ),
                Positioned(
                  child: Container(
                    //color: Colors.red.withOpacity(0.1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: Text(
                            'موجودی ${totalCoins}سکه',
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 20.0,
                                color: Palette.primaryDarkColor),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'مسدود شده',
                                  style: TextStyle(
                                      color: Palette.primaryBlockedCoinsColor,
                                      fontSize: 12.0),
                                ),
                                Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Text(
                                      '${blockedCoins} سکه ',
                                      style: TextStyle(
                                          color: Palette.primaryBlockedCoinsColor,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w700
                                      ),
                                    )),
                              ],
                            ),
                            Container(
                              width: 2.0,
                              height: 100,
                              color: Colors.grey,
                            ),
                            Column(
                              children: [
                                Text(
                                  'قابل برداشت',
                                  style: TextStyle(
                                      color: Palette.primaryAvailableCoinsColor,
                                      fontSize: 12.0),
                                ),
                                Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Text(
                                      '${availableCoins} سکه ',
                                      style: TextStyle(
                                          color: Palette
                                              .primaryAvailableCoinsColor,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w700),
                                    )),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                ),
                Positioned(
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.vertical(top: Radius.circular(50.0)),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(45, 10, 45, 0),
                          child: Container(
                            width: 300,
                            decoration: BoxDecoration(
                                color:
                                Palette.primaryLightColor.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(50.0)),
                            child: Column(
                              children: [
                                TabBar(
                                  onTap: (index) {
                                    //your currently selected index
                                    this.setState(() {
                                      selectedIndex = index;
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
                                      text: 'تبدیل سکه',
                                    ),
                                    Tab(
                                      text: 'گردش سکه',
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  bottom: -1,
                  left: 0,
                  right: 0,
                )
              ],
            ),
          ),
          CustomSliverHeader(selectedIndex: selectedIndex,),
          SliverFillRemaining(
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                CoinExchange(),
                CoinTurnover(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSliverHeader extends StatelessWidget {
  const CustomSliverHeader(
      {Key? key,
        this.backgroundColor = Palette.primaryLightColor, this.selectedIndex = 0
      })
      : super(key: key);

  final Color backgroundColor;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      floating: true,
      delegate: Delegate(backgroundColor, selectedIndex),
    );
  }
}

class Delegate extends SliverPersistentHeaderDelegate {
  final Color backgroundColor;
  final int selectedIndex;

  Delegate(this.backgroundColor, this.selectedIndex);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(18.0)),
          color: backgroundColor.withOpacity(0.8),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'تعداد سکه',
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.black),
              ),
              Text(
                selectedIndex == 0 ? 'مبلغ(تومان)' : 'شرح',
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.black),
              ),
              Text(
                'تاریخ',
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
