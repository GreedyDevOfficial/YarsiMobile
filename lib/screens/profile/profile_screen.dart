import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yarsi/components/components.dart';
import 'package:yarsi/config/palette.dart';
import 'package:yarsi/config/size_config.dart';
import 'package:yarsi/data/data.dart';
import 'package:yarsi/models/models.dart';
import 'package:yarsi/screens/screens.dart';
import 'package:yarsi/widgets/widgets.dart';

import 'components/profile_edit.dart';
import 'components/profile_post_list.dart';
import 'components/profile_repost_list.dart';

class ProfileScreen extends StatefulWidget {
  static String routeName = "/profile";

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with TickerProviderStateMixin {
  late TabController _nestedTabController;



  @override
  void dispose() {
    super.dispose();
    _nestedTabController.dispose();
  }

  double? longitude = 0;
  double? latitude = 0;

  int _selectedIndex = 0;


  @override
  void initState() {
    super.initState();
    _nestedTabController = new TabController(length: 3, vsync: this);

    print('**********');
    _determinePosition();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final Size size = MediaQuery.of(context).size;
    final User user = onlineUsers[2];
    final String identifier = '730-45983456';
    final int follower = 18;
    final int following = 5;
    final int repostCount = 10;
    return  DefaultTabController(
        length: 2,
        child: CustomScrollView(
            slivers: [
              SliverAppBar(
                  backgroundColor: Colors.transparent,
                  pinned: false,
                  floating: true,
                  leading: Container(),
                  automaticallyImplyLeading: false,
                  iconTheme: IconThemeData(color: Colors.transparent),
                  expandedHeight: MediaQuery.of(context).size.height * 0.45,
                  flexibleSpace: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Stack(
                            children: [
                              ClipPath(
                                clipper: LoginClipper(),
                                child: Image(
                                    image:
                                    AssetImage('assets/png/header_design.png'),
                                    fit: BoxFit.cover,
                                    height: size.height / 3,
                                    width: double.infinity,
                                    color: Color(0xFF000000).withOpacity(0.1)),
                              ),
                              CustomPaint(
                                size: Size(size.width, size.height / 3),
                                painter: LoginPainter(),
                              ),
                              Positioned(
                                right: 40.0,
                                top: 15.0,
                                child: Column(
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25.0)),
                                          color: Colors.white),
                                      child: IconButton(
                                        color: Colors.red,
                                        splashRadius: 30.0,
                                        splashColor: Colors.amber,
                                        icon: Icon(
                                          FontAwesomeIcons.pencil,
                                          size: 15,
                                          color: Colors.black,
                                        ),
                                        onPressed: () {
                                          Navigator.pushNamed(context, ProfileEdit.routeName,
                                              arguments: {
                                                'title': 'ویرایش پروفایل'
                                              }
                                          );                                    },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25.0)),
                                          color: Colors.white),
                                      child: IconButton(
                                        color: Colors.red,
                                        splashRadius: 30.0,
                                        splashColor: Colors.amber,
                                        icon: Icon(
                                          FontAwesomeIcons.mapMarkerAlt,
                                          size: 15,
                                          color: Colors.black,
                                        ),
                                        onPressed: () {
                                          Navigator.pushNamed(context, LocationPickerScreen.routeName,
                                              arguments: {
                                                'lat': latitude,
                                                'long': longitude,
                                                'title': 'موقعیت مکانی من'
                                              }
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ProfileAvatar(
                                        imageUrl: user.imageUrl,
                                        radius: 40.0,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    'شناسه: $identifier',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            'ری پست',
                                            style: TextStyle(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            '$repostCount',
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w900,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            'دنبال شونده',
                                            style: TextStyle(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            '$following K',
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w900,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            'دنبال کننده',
                                            style: TextStyle(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            '$follower K',
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w900,
                                                color: Colors.black),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding:
                            const EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 0.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Palette.primaryLightColor.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(50.0)),
                              child: TabBar(
                                onTap: (index) => setState(() => {
                                  _selectedIndex = index,
                                })
                                //your currently selected index
                                ,
                                //controller: _tabController,
                                indicator: BoxDecoration(
                                    color: Palette.primaryDarkColor,
                                    borderRadius: BorderRadius.circular(25.0)),
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'IRANSans'),
                                unselectedLabelColor: Colors.black,
                                labelColor: Colors.white,
                                tabs: [
                                  Tab(
                                    text: 'ری پست ها',
                                  ),
                                  Tab(
                                    text: 'پست ها',
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
              SliverFillRemaining(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 35.0) ,
                  child: IndexedStack(
                    index: _selectedIndex,
                    children: [
                      ProfileRepostList(),
                      ProfilePostList(),
                    ],
                  ),
                ),
              ),

            ]
        )
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Position currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high );
    this.setState(() {
      latitude = currentPosition.latitude;
      longitude = currentPosition.longitude;
    });

    return currentPosition;
  }
}
