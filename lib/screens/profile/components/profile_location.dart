import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yarsi/config/palette.dart';
import 'package:yarsi/widgets/dialog/dialogs/dialogs.dart';
import 'package:yarsi/widgets/widgets.dart';

import 'current_location.dart';

class ProfileLocation extends StatefulWidget {

  static String routeName = "/profile-location";

  const ProfileLocation({Key? key}) : super(key: key);


  @override
  State<ProfileLocation> createState() => _ProfileLocationState();
}

class _ProfileLocationState extends State<ProfileLocation> {

  final _formKey = GlobalKey<FormState>();

  final cityController = TextEditingController();
  final neighborhoodController = TextEditingController();
  final addressController = TextEditingController();
  final postalCodeController = TextEditingController();


  String? city;
  String? neighborhood;
  String? address;
  String? postalCode;

  @override
  Widget build(BuildContext context) {

    final Size screenSize = MediaQuery
        .of(context)
        .size;
    final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;

    return Scaffold(
      appBar:  PreferredSize(
        preferredSize: Size(screenSize.width, 100.0),
        child: SingleAppBar(onTap: () =>  {
        },),
      ) ,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Text(
                          'نام شهر',
                          style: TextStyle(
                              fontFamily: 'IRANSans',
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      Focus(
                        onFocusChange: (hasFocus) {
                          if(hasFocus) {
                          }
                        },
                        child: buildCityTextFormField( ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child:  Text(
                          'نام محله',
                          style: TextStyle(
                              fontFamily: 'IRANSans',
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      Focus(
                          child: buildNeighborhoodTextFormField()
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                  height: screenSize.height / 2,
                  child: CurrentLocation(lat: arguments['lat'], long: arguments['long'])
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child:  Text(
                          'آدرس پستی',
                          style: TextStyle(
                              fontFamily: 'IRANSans',
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      Focus(
                          child: buildTextFormField("address", Icons.location_city,
                              TextDirection.rtl, "خیابان شکوفه", addressController, 2 )
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child:  Text(
                          'کدپستی',
                          style: TextStyle(
                              fontFamily: 'IRANSans',
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      Focus(
                          child: buildTextFormField("postalCode", Icons.contact_mail,
                              TextDirection.rtl, "", postalCodeController)
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: NormalButton(
                          text: "ذخیره",
                          borderRadius: 25,
                          press: () {
                            print(addressController.text);
                            Navigator.pop(context);
                            SuccessDialog(context, 'تغییرات شما ذخیره گردید');
                          },
                          width: 100,
                        ),
                      ),
                      SizedBox(
                        height: 25.0,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  TextFormField buildTextFormField(
      String field, IconData icon, TextDirection direction, String hintText, TextEditingController controller, [int maxLines = 1]  ) {
    return TextFormField(
      keyboardType: TextInputType.text,
      autocorrect: false,
      textDirection: direction,
      controller: controller,
      textAlign: TextAlign.right,
      maxLines: maxLines,
      inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
      style: const TextStyle(
          fontSize: 22.0,
          fontFamily: 'IRANSans',
          fontWeight: FontWeight.normal,
          height: 1.9),
      onChanged: (value) {
      },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 14.0, color: Colors.black26, fontWeight: FontWeight.bold),
        focusColor: Colors.white,
        errorText: null,
        errorStyle: TextStyle(
          fontSize: 4.0,
        ),
        prefixIcon: SizedBox(
          width: 65.0,
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                child: Icon(
                  icon,
                  size: 35.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        fillColor: kPrimaryBackgroundColor,
        prefixStyle: TextStyle(color: Colors.grey),
      ),
    );
  }
  TextFormField buildCityTextFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      autocorrect: false,
      readOnly: true,
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.right,
      controller: cityController,
      inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
      style: const TextStyle(
          fontSize: 22.0,
          fontFamily: 'IRANSans',
          fontWeight: FontWeight.normal,
          height: 1.9),
      onChanged: (value) {
      },
      onTap: () => {
        showModalBottomSheet(
          barrierColor: Colors.black.withOpacity(0.7),
          enableDrag: false,
          isDismissible: true,
          isScrollControlled: false,
          backgroundColor: Palette.primaryLightBackground,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(15.0))),
          context: context,
          builder: (context) => BottomModalSelector(
            child: city_options(context),
          ),
        )
      },
      decoration: InputDecoration(
        hintText: 'تهران',
        hintStyle: TextStyle(fontSize: 14.0, color: Colors.black26, fontWeight: FontWeight.bold),
        focusColor: Colors.white,
        errorText: null,
        errorStyle: TextStyle(
          fontSize: 4.0,
        ),
        prefixIcon: SizedBox(
          width: 65.0,
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                child: Icon(
                  Icons.place,
                  size: 35.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        fillColor: kPrimaryBackgroundColor,
        prefixStyle: TextStyle(color: Colors.grey),
      ),
    );
  }
  TextFormField buildNeighborhoodTextFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      autocorrect: false,
      readOnly: true,
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.right,
      controller: neighborhoodController,
      inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
      style: const TextStyle(
          fontSize: 22.0,
          fontFamily: 'IRANSans',
          fontWeight: FontWeight.normal,
          height: 1.9),
      onChanged: (value) {
      },
      onTap: () => {
        showModalBottomSheet(
          barrierColor: Colors.black.withOpacity(0.7),
          enableDrag: false,
          isDismissible: true,
          isScrollControlled: false,
          backgroundColor: Palette.primaryLightBackground,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(15.0))),
          context: context,
          builder: (context) => BottomModalSelector(
            child: neighborhood_options(context),
          ),
        )
      },
      decoration: InputDecoration(
        hintText: 'صادقیه',
        hintStyle: TextStyle(fontSize: 14.0, color: Colors.black26, fontWeight: FontWeight.bold),
        focusColor: Colors.white,
        errorText: null,
        errorStyle: TextStyle(
          fontSize: 4.0,
        ),
        prefixIcon: SizedBox(
          width: 65.0,
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                child: Icon(
                  Icons.place,
                  size: 35.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        fillColor: kPrimaryBackgroundColor,
        prefixStyle: TextStyle(color: Colors.grey),
      ),
    );
  }

}

Widget city_options(BuildContext context) => SingleChildScrollView(
  child:   Column(
    children: [
      BottomModalOption(
          label: 'تهران',
          onTap: () => {}),
      DashedDivider(
        height: 1.0,
        color: Colors.grey,
      ),
      BottomModalOption(
        label: 'اصفهان',
        onTap: () => {},
      ),
      DashedDivider(
        height: 1.0,
        color: Colors.grey,
      ),
      BottomModalOption(
        label: 'کرج',
        onTap: () => {},
      ),
      DashedDivider(
        height: 1.0,
        color: Colors.grey,
      ),
      BottomModalOption(
        label: 'یزد',
        onTap: () => {},
      ),
      DashedDivider(
        height: 1.0,
        color: Colors.grey,
      ),
      BottomModalOption(
        label: 'مشهد',
        onTap: () => {},
      ),
      DashedDivider(
        height: 1.0,
        color: Colors.grey,
      ),
      BottomModalOption(
        label: 'سمنان',
        onTap: () => {},
      ),
      DashedDivider(
        height: 1.0,
        color: Colors.grey,
      ),
      BottomModalOption(
        label: 'زنجان',
        onTap: () => {},
      ),
    ],
  ),
);
Widget neighborhood_options(BuildContext context) => SingleChildScrollView(
  child:   Column(
    children: [
      BottomModalOption(
          label: 'جمشیدیه',
          onTap: () => {}),
      DashedDivider(
        height: 1.0,
        color: Colors.grey,
      ),
      BottomModalOption(
        label: 'تجریش',
        onTap: () => {},
      ),
      DashedDivider(
        height: 1.0,
        color: Colors.grey,
      ),
      BottomModalOption(
        label: 'الهیه',
        onTap: () => {},
      ),
      DashedDivider(
        height: 1.0,
        color: Colors.grey,
      ),
      BottomModalOption(
        label: 'توحید',
        onTap: () => {},
      ),
      DashedDivider(
        height: 1.0,
        color: Colors.grey,
      ),
      BottomModalOption(
        label: 'صادقیه',
        onTap: () => {},
      ),

    ],
  ),
);


