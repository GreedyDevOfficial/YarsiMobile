import 'package:flutter/material.dart';
import 'package:yarsi/config/palette.dart';
import 'upgrade_identity_code.dart';
import 'upgrade_identity_document.dart';

class UpgradeStepThree extends StatefulWidget {
  const UpgradeStepThree({Key? key}) : super(key: key);

  @override
  State<UpgradeStepThree> createState() => _UpgradeStepThreeState();
}

class _UpgradeStepThreeState extends State<UpgradeStepThree> {


  int _selectedIndex = 0;

  static  final List<Widget> _views = [
    UpgradeIdentityDocument(),
    UpgradeIdentityCode()
  ];

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Column(
      children: [
        DefaultTabController(
          length: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
                    text: 'ارسال مدارک',
                  ),
                  Tab(
                    text: 'کدنمایندگی',
                  ),
                ],
              ),
            ),
          ),

        ),
        Container(
            height: 500.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
              child: IndexedStack(
                index: _selectedIndex,
                children: _views,
              ),
            )
        )
      ],
    );
  }
}

