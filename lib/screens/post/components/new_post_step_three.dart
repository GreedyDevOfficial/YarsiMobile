import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yarsi/widgets/multipleselect/multi_select_flutter.dart';
import 'package:yarsi/config/palette.dart';
import 'package:yarsi/data/data.dart';
import 'package:yarsi/models/models.dart';

class NewPostStepThree extends StatefulWidget {
  const NewPostStepThree({Key? key}) : super(key: key);

  @override
  State<NewPostStepThree> createState() => _NewPostStepThreeState();
}

class _NewPostStepThreeState extends State<NewPostStepThree> {

  TextEditingController discountPercentageController = TextEditingController();
  TextEditingController priceBeforeDiscountController = TextEditingController();
  TextEditingController saleCountController = TextEditingController();
  TextEditingController affiliateFeeController = TextEditingController();
  TextEditingController keyWordController = TextEditingController();
  TextEditingController storeLinkController = TextEditingController();
  TextEditingController giftCityController = TextEditingController();
  TextEditingController giftQuarterController = TextEditingController();

  final _cities = cities
      .map((city) => MultiSelectItem<City>(city, city.name))
      .toList();
  List<Object?> _selectedCities = [cities[2], cities[1]];

  final _quarters = quarters
      .map((quarter) => MultiSelectItem<Quarter>(quarter, quarter.name))
      .toList();
  List<Object?> _selectedQuarters = [quarters[2], quarters[1]];

  double _applicationFeePercentage = 2;
  double _participationCount = 4;
  double marketingCoinsFee = 1200;
  double marketingTomansFee = 50000;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Text(
              ' درصد تخفیف (اختیاری)',
              style: TextStyle(
                  fontFamily: 'IRANSans',
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Focus(
              child: buildNumberFormField(
                  "discountPercentage",
                  TextDirection.ltr,
                  "",
                  discountPercentageController,
                  TextAlign.center
              )
          ),
          SizedBox(height: 15.0,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Text(
              'قیمت کالا قبل از تخفیف (اختیاری-تومان)',
              style: TextStyle(
                  fontFamily: 'IRANSans',
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Focus(
              child: buildNumberFormField(
                  "priceBeforeDiscount",
                  TextDirection.ltr,
                  "",
                  priceBeforeDiscountController,
                  TextAlign.center
              )
          ),
          SizedBox(height: 15.0,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Text(
              'تعداد فروش',
              style: TextStyle(
                  fontFamily: 'IRANSans',
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Focus(
              child: buildNumberFormField(
                  "saleCount",
                  TextDirection.ltr,
                  "",
                  saleCountController,
                  TextAlign.center
              )
          ),
          SizedBox(height: 15.0,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Text(
              'هزینه همکاری در فروش (اختیاری-تومان)',
              style: TextStyle(
                  fontFamily: 'IRANSans',
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Focus(
              child: buildNumberFormField(
                  "affiliateFee",
                  TextDirection.ltr,
                  "",
                  affiliateFeeController,
                  TextAlign.center
              )
          ),
          SizedBox(height: 15.0,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Text(
              'کلمات کلیدی (با خط تیره جدا شود)',
              style: TextStyle(
                  fontFamily: 'IRANSans',
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Focus(
              child: buildTextFormField(
                  "keyWords",
                  TextDirection.ltr,
                  "",
                  keyWordController,
                  TextAlign.right
              )
          ),
          SizedBox(height: 15.0,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Text(
              'لینک خرید از فروشگاه',
              style: TextStyle(
                  fontFamily: 'IRANSans',
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Focus(
              child: buildTextFormField(
                  "storeLink",
                  TextDirection.ltr,
                  "",
                  storeLinkController,
                  TextAlign.left
              )
          ),
          SizedBox(height: 15.0,),
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
          SizedBox(height: 15.0,),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(' ${marketingTomansFee}', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 14),),
              Text(' یارسی معادل با ', style: TextStyle(fontSize: 12),),
              Text(' ${marketingCoinsFee}', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 14), ),
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
  TextFormField buildNumberFormField(
      String field,
      TextDirection direction,
      String hintText,
      TextEditingController controller,
      [TextAlign textAlign = TextAlign.center, int maxLines = 1]) {
    return TextFormField(
      keyboardType: TextInputType.number,
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
  TextFormField buildTextFormField(
      String field,
      TextDirection direction,
      String hintText,
      TextEditingController controller,
      [TextAlign textAlign = TextAlign.center, int maxLines = 1]) {
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
}

