import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yarsi/widgets/multipleselect/multi_select_flutter.dart';
import 'package:yarsi/config/palette.dart';
import 'package:yarsi/data/data.dart';
import 'package:yarsi/models/models.dart';
import 'package:yarsi/screens/screens.dart';
import 'package:yarsi/widgets/widgets.dart';

class UpgradeStepOne extends StatefulWidget {
  const UpgradeStepOne({Key? key}) : super(key: key);

  @override
  State<UpgradeStepOne> createState() => _UpgradeStepOneState();
}

class _UpgradeStepOneState extends State<UpgradeStepOne> {

  TextEditingController storeNameController = TextEditingController();
  TextEditingController storeIdController = TextEditingController();
  TextEditingController guildController = TextEditingController();
  TextEditingController storePhoneController = TextEditingController();
  TextEditingController storePostalCodeController = TextEditingController();
  TextEditingController storeAddressController = TextEditingController();


  final _cities = cities
      .map((city) => MultiSelectItem<City>(city, city.name))
      .toList();
  List<Object?> _selectedCities = [cities[2], cities[1]];

  final _quarters = quarters
      .map((quarter) => MultiSelectItem<Quarter>(quarter, quarter.name))
      .toList();
  List<Object?> _selectedQuarters = [quarters[2], quarters[1]];


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          child: Text(
            'نام فروشگاه',
            style: TextStyle(
                fontFamily: 'IRANSans',
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ),
        Focus(
            child: buildTextFormField(
                "storeName",
                TextDirection.rtl,
                false,
                "نام فروشگاه به فارسی",
                storeNameController,
                TextAlign.right
            )
        ),
        SizedBox(
          height: 5.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          child: Text(
            'شناسه فروشگاه',
            style: TextStyle(
                fontFamily: 'IRANSans',
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ),
        Focus(
            child: buildTextFormField(
                "storeId",
                TextDirection.ltr,
                false,
                "با کلمات انگلیسی تایپ شود مانند aminstore",
                storeIdController,
                TextAlign.left
            )
        ),
        SizedBox(
          height: 5.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          child: Text(
            'نوع صنف',
            style: TextStyle(
                fontFamily: 'IRANSans',
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ),
        Focus(
            child: buildGuildTypeTextFormField(
                "guild",
                TextDirection.ltr,
                true,
                "",
                guildController,
                TextAlign.center
            )
        ),
        SizedBox(height: 5.0,),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          child: Text(
            'تلفن فروشگاه',
            style: TextStyle(
                fontFamily: 'IRANSans',
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ),
        Focus(
            child: buildTextFormField(
                "storePhone",
                TextDirection.ltr,
                false,
                "",
                storePhoneController,
                TextAlign.left
            )
        ),
        SizedBox(
          height: 5.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          child: Text(
            'کدپستی فروشگاه',
            style: TextStyle(
                fontFamily: 'IRANSans',
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ),
        Focus(
            child: buildTextFormField(
                "storePostalCode",
                TextDirection.ltr,
                false,
                "",
                storePostalCodeController,
                TextAlign.center
            )
        ),
        SizedBox(
          height: 5.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          child: Text(
            'آدرس فروشگاه',
            style: TextStyle(
                fontFamily: 'IRANSans',
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ),
        Focus(
            child: buildTextFormField(
                "storeAddress",
                TextDirection.ltr,
                false,
                "",
                storeAddressController,
                TextAlign.right,
                3
            )
        ),
        SizedBox(
          height: 15.0,
        ),
        Center(
          child: Material(
            borderRadius: BorderRadius.circular(7.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(7.0),
              onTap: () => {
                  Navigator.pushNamed(context, LocationPickerScreen.routeName, arguments: {
                    'title': 'انتخاب لوکیشن'
                  })
              },
              child: Container(
                width: 95,
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  color: Palette.primaryLightColor.withOpacity(0.5)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(FontAwesomeIcons.mapMarkerAlt, size: 18.0, color: Palette.primaryDarkColor,),
                    Text('انتخاب لوکیشن', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 10.0, color: Palette.primaryDarkColor),)
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
      ],
    );
  }
  TextFormField buildTextFormField(
      String field,
      TextDirection direction,
      bool readOnly,
      String hintText,
      TextEditingController controller,
      [TextAlign textAlign = TextAlign.right, int maxLines = 1]) {
    return TextFormField(
      keyboardType: TextInputType.text,
      autocorrect: false,
      readOnly: readOnly,
      textDirection: direction,
      controller: controller,
      textAlign: textAlign,
      maxLines: maxLines,
      inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
      style: const TextStyle(
          fontSize: 18.0,
          fontFamily: 'IRANSans',
          fontWeight: FontWeight.normal,
          height: 1.9),
      onChanged: (value) {},
      decoration: InputDecoration(
        hintText: hintText,
        hintTextDirection: TextDirection.rtl,
        hintStyle: TextStyle(
            fontSize: 14.0, color: Colors.black26, fontWeight: FontWeight.bold),
        focusColor: Colors.white,
        errorText: null,
        errorStyle: TextStyle(
          fontSize: 4.0,
        ),
        fillColor: kPrimaryBackgroundColor,
        prefixStyle: TextStyle(color: Colors.grey),
      ),
    );
  }
  TextFormField buildGuildTypeTextFormField(
      String field,
      TextDirection direction,
      bool readOnly,
      String hintText,
      TextEditingController controller,
      [TextAlign textAlign = TextAlign.right, int maxLines = 1]) {
    return TextFormField(
      keyboardType: TextInputType.text,
      autocorrect: false,
      readOnly: readOnly,
      textDirection: direction,
      controller: controller,
      textAlign: textAlign,
      maxLines: maxLines,
      inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
      style: const TextStyle(
          fontSize: 18.0,
          fontFamily: 'IRANSans',
          fontWeight: FontWeight.normal,
          height: 1.9),
      onChanged: (value) {},
      onTap: () => {
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
            child: guild_options(context),
          ),
        )
      },
      decoration: InputDecoration(
        hintText: hintText,
        hintTextDirection: TextDirection.rtl,
        hintStyle: TextStyle(
            fontSize: 14.0, color: Colors.black26, fontWeight: FontWeight.bold),
        focusColor: Colors.white,
        errorText: null,
        errorStyle: TextStyle(
          fontSize: 4.0,
        ),
        fillColor: kPrimaryBackgroundColor,
        prefixStyle: TextStyle(color: Colors.grey),
      ),
    );
  }
  Widget guild_options(BuildContext context) => ListView.builder(
    shrinkWrap: true,
    scrollDirection: Axis.vertical,
    itemCount:  guilds.length,
    itemBuilder: (BuildContext context, int index){
      final Guild guild = guilds[index];
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.0),
        child: Column(
          children: [
            BottomModalOption(
                label: guild.guildTitle,
                onTap: () => {
                  this.guildController.text = guild.guildTitle,
                  Navigator.pop(context)
                }),
            DashedDivider(
              height: 1.0,
              color: Colors.grey,
            ),
          ],
        ),
      );
    },
  );
}
