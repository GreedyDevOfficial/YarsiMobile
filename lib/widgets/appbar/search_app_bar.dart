import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yarsi/config/palette.dart';
import 'package:yarsi/data/data.dart';
import 'package:yarsi/models/models.dart';
import 'package:yarsi/screens/screens.dart';
import 'package:yarsi/widgets/widgets.dart';


class SearchAppBar extends StatefulWidget {
  final Function() onTap;

  const SearchAppBar({Key? key, required this.onTap}) : super(key: key);

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  String search = '';
  late Color _color = kPrimaryBackgroundColor;

  String cityName = 'همه شهرها';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            height: 50.0,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 8,
                  offset: Offset(1, 2), // Shadow position
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    CircleButton(
                        icon: FontAwesomeIcons.coins,
                        iconSize: 22.0,
                        onPressed: () => print('Messenger')),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0.0),
                      child: Text(
                        '125',
                        style: TextStyle(
                            fontSize: 8.0,
                            color: kPrimaryDarkColor,
                            fontWeight: FontWeight.w900),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child:
                    Container(height: 37.0, child: buildSearchFormField()),
                  ),
                ),
                Material(
                  color: Colors.white,
                  child: InkWell(
                    onTap: ()=>{
                      showModalBottomSheet(
                        barrierColor: Colors.black.withOpacity(0.7),
                        enableDrag: false,
                        isDismissible: true,
                        isScrollControlled: false,
                        backgroundColor: Palette.primaryLightBackground,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(15.0))),
                        context: context,
                        builder: (context) => BottomModalSelector(
                          heightFactor: 1,
                          child: city_options(context),
                        ),
                      )
                    },
                    child: Container(
                      constraints: BoxConstraints(minWidth: 60.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(FontAwesomeIcons.mapMarkerAlt, size: 15.0, color: Palette.primaryDarkColor,),
                          SizedBox(height: 5.0,),
                          Text(cityName, style: TextStyle(fontSize: 8.0, color: Palette.primaryDarkColor, fontWeight: FontWeight.w700),)
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: GestureDetector(
                    onTap: () => {Scaffold.of(context).openEndDrawer()},
                    child: SvgPicture.asset(
                      'assets/svg/yarsi_logo.svg',
                      matchTextDirection: false,
                      width: 35.0,
                      color: kPrimaryDarkColor,
                    ),
                  ),
                ),
              ],
            )
        )
    );
  }

  TextFormField buildSearchFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      autocorrect: false,
      focusNode: FocusNode(),
      textDirection: TextDirection.rtl,
      inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
      onSaved: (newValue) => search = newValue!,
      style: const TextStyle(
          fontSize: 12.0,
          fontFamily: 'IRANSans',
          fontWeight: FontWeight.w700,
          letterSpacing: 1.0,
          height: 1.7),
      onChanged: (value) {},
      onTap: () => {
        FocusScope.of(context).unfocus(),
        Navigator.pushNamed(context, ExploreViewMore.routeName, arguments: {
          'title': 'جستجو',
          'type' : 'همه'
        })
      },
      decoration: InputDecoration(
        hintText: "جستجو",
        hintTextDirection: TextDirection.rtl,
        hintStyle: TextStyle(
          letterSpacing: 0.1,
          fontSize: 12.0,
        ),
        focusColor: Colors.white,
        enabled: true,
        errorText: null,
        errorStyle: TextStyle(
          fontSize: 4.0,
        ),
        fillColor: _color,
        prefixStyle: TextStyle(color: Colors.grey),
        contentPadding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 5),
        suffixIcon: Icon(Icons.search, color: Colors.grey,),
      ),
    );
  }
  TextFormField buildCitySearchField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      autocorrect: false,
      focusNode: FocusNode(),
      textDirection: TextDirection.rtl,
      inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
      onSaved: (newValue) => search = newValue!,
      style: const TextStyle(
          fontSize: 12.0,
          fontFamily: 'IRANSans',
          fontWeight: FontWeight.w700,
          letterSpacing: 1.0,
          height: 1.7),
      onChanged: (value) {},
      onTap: () => {
        FocusScope.of(context).unfocus(),
      },
      decoration: InputDecoration(
        hintText: "جستجو",
        hintTextDirection: TextDirection.rtl,
        hintStyle: TextStyle(
          letterSpacing: 0.1,
          fontSize: 12.0,
        ),
        focusColor: Colors.white,
        enabled: true,
        errorText: null,
        errorStyle: TextStyle(
          fontSize: 4.0,
        ),
        fillColor: _color,
        prefixStyle: TextStyle(color: Colors.grey),
        contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
        prefixIcon: Icon(Icons.search, color: Colors.grey,),
      ),
    );
  }
  Widget city_options(BuildContext context) => Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
        child: buildCitySearchField(),
      ),
      DashedDivider(height: 1.0, color: Colors.grey,),
      SizedBox(height: 10.0,),
      Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount:  cities.length,
          itemBuilder: (BuildContext context, int index){
            final City city = cities[index];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: Column(
                children: [
                  NormalButton(
                    width: MediaQuery.of(context).size.width * 2 / 3,
                    backgroundColor: Colors.white,
                    text: city.name,
                    press: () => {
                      setState(() {
                        cityName = city.name;
                      }),
                      Navigator.pop(context)
                    },
                  ),
                  SizedBox(height: 10.0,)
                ],
              ),
            );
          },
        ),
      ),
    ],
  );
}
