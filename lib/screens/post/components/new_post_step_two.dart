import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yarsi/widgets/multipleselect/multi_select_flutter.dart';
import 'package:yarsi/config/palette.dart';
import 'package:yarsi/data/data.dart';
import 'package:yarsi/models/models.dart';
import 'package:yarsi/widgets/widgets.dart';

class NewPostStepTwo extends StatefulWidget {
  const NewPostStepTwo({Key? key}) : super(key: key);

  @override
  State<NewPostStepTwo> createState() => _NewPostStepTwoState();
}

class _NewPostStepTwoState extends State<NewPostStepTwo> {

  TextEditingController guildTypeController = TextEditingController();
  TextEditingController giftCityController = TextEditingController();
  TextEditingController giftQuarterController = TextEditingController();
  TextEditingController postVisitCountController = TextEditingController();
  TextEditingController postGiftCoinsController = TextEditingController();
  TextEditingController repeatPostForGiftController = TextEditingController();

  final _cities = cities
      .map((city) => MultiSelectItem<City>(city, city.name))
      .toList();
  List<Object?> _selectedCities = [cities[2], cities[1]];

  final _quarters = quarters
      .map((quarter) => MultiSelectItem<Quarter>(quarter, quarter.name))
      .toList();
  List<Object?> _selectedQuarters = [quarters[2], quarters[1]];

  String ganderType = 'both';
  double advCoinsFee = 1200;
  double advTomansFee = 50000;
  String repeatPostForGift ="daily";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Text(
              'جنسیت',
              style: TextStyle(
                  fontFamily: 'IRANSans',
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NormalButton(
                text: "مرد",
                backgroundColor: ganderType == "male" ? Palette.primaryDarkColor : Palette.primaryLightColor ,
                width: 75,
                borderRadius: 25,
                press: () {
                  setState(() {
                    ganderType = "male";
                  });
                },
              ),
              NormalButton(
                text: "زن",
                width: 75,
                borderRadius: 25,
                backgroundColor: ganderType == "female" ? Palette.primaryDarkColor : Palette.primaryLightColor ,
                press: () {
                  setState(() {
                    ganderType = "female";
                  });
                },
              ),
              NormalButton(
                text: "هردو",
                width: 75,
                borderRadius: 25,
                backgroundColor: ganderType == "both" ? Palette.primaryDarkColor : Palette.primaryLightColor ,
                press: () {
                  setState(() {
                    ganderType = "both";
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 5.0,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Text(
              'نوع صنف',
              style: TextStyle(
                  fontFamily: 'IRANSans',
                  fontWeight: FontWeight.bold,
                  color: Colors.black
              ),
            ),
          ),
          Focus(
              child: buildGuildTypeTextFormField(
                  "guildType",
                  Icons.person,
                  TextDirection.rtl,
                  "",
                  guildTypeController)
          ),
          SizedBox(
            height: 5.0,
          ),
          SizedBox(
            height: 5.0,
          ),
          MultiSelectBottomSheetField(
            initialChildSize: 0.6,
            initialValue: _selectedCities,
            listType: MultiSelectListType.CHIP,
            searchable: true,
            selectedColor:
            Palette.primaryDarkColor.withOpacity(0.5),
            unselectedColor:
            Palette.primaryLightColor.withOpacity(0.5),
            //backgroundColor: Palette.primaryLightBackground,
            buttonText: Text(
              "موقعیت مکانی هدیه(پیش فرض: همه شهرها)",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 12.0),
            ),
            title: Text(
              "شهر های مورد نظر خود را انتخاب کنید",
              style: TextStyle(fontSize: 12.0),
            ),
            confirmText: Text(
              'تایید',
              style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w700,
                  fontSize: 12.0),
            ),
            cancelText: Text(
              'انصراف',
              style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w700,
                  fontSize: 12.0),
            ),
            searchHint: 'جستجو',
            items: _cities,
            onConfirm: (values) {
              setState(() {
                _selectedCities = values;
              });
            },
            chipDisplay: MultiSelectChipDisplay(
              alignment: Alignment.center,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.all(Radius.circular(5.0))),
              //icon: Icon(Icons.close_rounded),
              onTap: (value) {
                // print(value);
                // setState(() {
                //   _selectedFavorites.remove(value);
                // });
              },
            ),
          ),
          _selectedCities.length == 0 ||
              _selectedCities.isEmpty
              ? Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.centerRight,
              child: Text(
                "انتخابی نشده",
                style: TextStyle(color: Colors.black54),
              )
          )
              : Container(),
          SizedBox(
            height: 5.0,
          ),
          MultiSelectBottomSheetField(
            initialChildSize: 0.6,
            initialValue: _selectedQuarters,
            listType: MultiSelectListType.CHIP,
            searchable: false,
            selectedColor:
            Palette.primaryDarkColor.withOpacity(0.5),
            unselectedColor:
            Palette.primaryLightColor.withOpacity(0.5),
            //backgroundColor: Palette.primaryLightBackground,
            buttonText: Text(
              "موقعیت مکانی هدیه(پیش فرض: همه محله ها)",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 12.0),
            ),
            title: Text(
              "شهر های مورد نظر خود را انتخاب کنید",
              style: TextStyle(fontSize: 12.0),
            ),
            confirmText: Text(
              'تایید',
              style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w700,
                  fontSize: 12.0),
            ),
            cancelText: Text(
              'انصراف',
              style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w700,
                  fontSize: 12.0),
            ),
            searchHint: 'جستجو',
            items: _quarters,
            onConfirm: (values) {
              setState(() {
                _selectedQuarters = values;
              });
            },
            chipDisplay: MultiSelectChipDisplay(
              alignment: Alignment.center,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.all(Radius.circular(5.0))),
              //icon: Icon(Icons.close_rounded),
              onTap: (value) {
                // print(value);
                // setState(() {
                //   _selectedFavorites.remove(value);
                // });
              },
            ),
          ),
          _selectedQuarters.length == 0 ||
              _selectedQuarters.isEmpty
              ? Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.centerRight,
              child: Text(
                "انتخابی نشده",
                style: TextStyle(color: Colors.black54),
              ))
              : Container(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Text(
              'تعداد بازدید پست',
              style: TextStyle(
                  fontFamily: 'IRANSans',
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Focus(
              child: buildPostVisitCountTextFormField(
                  "postVisitCount",
                  TextDirection.rtl,
                  "",
                  postVisitCountController,
                  TextAlign.center
              )
          ),
          SizedBox(
            height: 5.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Text(
              'تعداد سکه دریافتی',
              style: TextStyle(
                  fontFamily: 'IRANSans',
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Focus(
              child: buildPostVisitCountTextFormField(
                  "postGiftCoins",
                  TextDirection.rtl,
                  "",
                  postGiftCoinsController,
                  TextAlign.center
              )
          ),
          SizedBox(
            height: 5.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Text(
              'تکرارپست جهت دریافت هدیه',
              style: TextStyle(
                  fontFamily: 'IRANSans',
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Focus(
              child: buildRepeatPostForGiftTextFormField(
                  "repeatPostForGift",
                  TextDirection.ltr,
                  "",
                  repeatPostForGiftController,
                  TextAlign.center
              )
          ),
          SizedBox(height: 15.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(' ${advTomansFee}', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 14),),
              Text(' یارسی معادل با ', style: TextStyle(fontSize: 12),),
              Text(' ${advCoinsFee}', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 14), ),
              SizedBox(width: 10.0,),
              Icon(FontAwesomeIcons.coins, color: Palette.primaryLightColor,),
            ],
          ),
          SizedBox(
            height: 35.0,
          )
        ],
      ),
    );
  }
  TextFormField buildGuildTypeTextFormField(
      String field,
      IconData icon,
      TextDirection direction,
      String hintText,
      TextEditingController controller,
      [int maxLines = 1]) {
    return TextFormField(
      keyboardType: TextInputType.text,
      autocorrect: false,
      textDirection: direction,
      controller: controller,
      textAlign: TextAlign.right,
      maxLines: maxLines,
      inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
      style: const TextStyle(
          fontSize: 16.0,
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
  TextFormField buildPostVisitCountTextFormField(
      String field,
      TextDirection direction,
      String hintText,
      TextEditingController controller,
      [TextAlign textAlign = TextAlign.right, int maxLines = 1]) {
    return TextFormField(
      keyboardType: TextInputType.text,
      autocorrect: false,
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
  TextFormField buildRepeatPostForGiftTextFormField(
      String field,
      TextDirection direction,
      String hintText,
      TextEditingController controller,
      [TextAlign textAlign = TextAlign.right, int maxLines = 1]) {
    return TextFormField(
      keyboardType: TextInputType.text,
      autocorrect: false,
      readOnly: true,
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
            child: repeatPostForGift_options(context),
          ),
        )
      },
      decoration: InputDecoration(
        hintText: hintText,
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
  Widget repeatPostForGift_options(BuildContext context) => SingleChildScrollView(
    child: Column(
      children: [
        BottomModalOption(
            label: 'روزانه',
            onTap: () => {
              Navigator.pop(context),
              repeatPostForGiftController.text = 'روزانه',
              setState(() {
                repeatPostForGift = 'daily';
              })
            }),
        DashedDivider(
          height: 1.0,
          color: Colors.grey,
        ),
        BottomModalOption(
            label: 'هفتگی',
            onTap: () => {
              Navigator.pop(context),
              repeatPostForGiftController.text = 'هفتگی',
              setState(() {
                repeatPostForGift = 'weekly';
              })
            }),
        DashedDivider(
          height: 1.0,
          color: Colors.grey,
        ),
        BottomModalOption(
          label: 'ماهانه',
          onTap: () => {
            Navigator.pop(context),
            repeatPostForGiftController.text = 'ماهانه',
            setState(() {
              repeatPostForGift = 'monthly';
            })
          },
        ),
        DashedDivider(
          height: 1.0,
          color: Colors.grey,
        ),
        BottomModalOption(
          label: 'دوبار در ماه',
          onTap: () => {
            Navigator.pop(context),
            repeatPostForGiftController.text = 'دوبار در ماه',
            setState(() {
              repeatPostForGift = 'twice-in-month';
            })
          },
        ),
        DashedDivider(
          height: 1.0,
          color: Colors.grey,
        ),
        BottomModalOption(
          label: 'سه ماهه',
          onTap: () => {
            Navigator.pop(context),
            repeatPostForGiftController.text = 'سه ماهه',
            setState(() {
                repeatPostForGift = 'three-month';
            })
          },
        ),
      ],
    ),
  );
  Widget guild_options(BuildContext context) => ListView.builder(
    shrinkWrap: true,
    scrollDirection: Axis.vertical,
    itemCount:  banks.length,
    itemBuilder: (BuildContext context, int index){
      final Guild guild = guilds[index];
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.0),
        child: Column(
          children: [
            BottomModalOption(
                label: guild.guildTitle,
                onTap: () => {
                  this.guildTypeController.text = guild.guildTitle,
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


