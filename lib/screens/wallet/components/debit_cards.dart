import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yarsi/config/palette.dart';
import 'package:yarsi/data/data.dart';
import 'package:yarsi/models/models.dart';
import 'package:yarsi/widgets/widgets.dart';

import 'wallet_bankCard.dart';

class DebitCards extends StatefulWidget {
  static String routeName = "/debit-cards";

  const DebitCards({Key? key}) : super(key: key);

  @override
  State<DebitCards> createState() => _DebitCardsState();
}

class _DebitCardsState extends State<DebitCards> {

  var _selectedIndex = 0;

  final bankNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery
        .of(context)
        .size;
    return SafeArea(
        child: Scaffold(
          appBar:  PreferredSize(
            preferredSize: Size(screenSize.width, 100.0),
            child: SingleAppBar(onTap: () =>  {
            },),
          ) ,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Color(0xFFDA9F2B).withOpacity(0.4),
                automaticallyImplyLeading: false,
                bottom: PreferredSize(
                  child: Container(),
                  preferredSize: Size(0, 20),
                ),
                pinned: false,
                expandedHeight: MediaQuery.of(context).size.height * 0.40,
                flexibleSpace: Stack(
                  children: [
                    Positioned(
                      child: Image(
                          image: AssetImage('assets/png/header_design.png'),
                          fit: BoxFit.cover,
                          height: screenSize.height / 3,
                          width: double.infinity,
                          color: Color(0xFF000000).withOpacity(0.05)),
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                    ),
                    Positioned(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 20.0),
                        height: screenSize.height / 4,
                        width: screenSize.width,
                        child: PageView.builder(
                            onPageChanged: (index) {
                              setState((){
                                _selectedIndex = index;
                              });
                            },
                            controller: PageController(viewportFraction: 0.75),
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              var _scale = _selectedIndex == index ? 1.0 : 0.8;
                              return TweenAnimationBuilder(
                                  tween: Tween(begin: _scale, end: _scale),
                                  curve: Curves.ease,
                                  duration: const Duration(milliseconds: 350),
                                  builder: (BuildContext context, double value, Widget? child) {
                                    print(value);
                                    return Transform.scale(
                                      scale: value ,
                                      child: child,
                                    );
                                  },
                                  child: WalletBankCard(
                                    index :index,
                                    cardNumber: "4423 7615 9460 3072",
                                    nameFamily: "علی محمدی",
                                  )
                              );
                            }
                        ),
                      ),
                      top: 0,
                    ),
                    Positioned(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Palette.primaryLightBackground,
                          borderRadius: BorderRadius.vertical(top: Radius.circular(50.0)),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(45, 10, 45, 0),
                              child: Container(
                                width: screenSize.width,
                                decoration: BoxDecoration(
                                    color: Palette.primaryLightColor.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(50.0)),
                                child: Column(
                                  children: [
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
                    ),
                  ],
                ),
              ),
              SliverFillRemaining(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 5.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Text(
                            'نام بانک',
                            style: TextStyle(
                                fontFamily: 'IRANSans',
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        Focus(child: buildBankNameTextFormField()),
                        SizedBox(
                          height: 5.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Text(
                            'شماره ۱۶ رقمی کارت',
                            style: TextStyle(
                                fontFamily: 'IRANSans',
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        Focus(child: buildBankCardNumberTextFormField()),
                        SizedBox(
                          height: 5.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Text(
                            'شماره شبا',
                            style: TextStyle(
                                fontFamily: 'IRANSans',
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        Focus(child: buildShabaNumberTextFormField()),
                        SizedBox(
                          height: 5.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Text(
                            'نام و نام خانوادگی',
                            style: TextStyle(
                                fontFamily: 'IRANSans',
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        Focus(child: buildNameFamilyTextFormField()),
                        SizedBox(
                          height: 5.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Text(
                            'کدملی',
                            style: TextStyle(
                                fontFamily: 'IRANSans',
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        Focus(child: buildNationalCodeTextFormField()),
                        SizedBox(
                          height: 25.0,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: NormalButton(
                            text: "ذخیره",
                            borderRadius: 25,
                            press: () {
                              Navigator.pop(context);
                              SuccessDialog(context, 'تغییرات شما ذخیره گردید');
                            },
                            width: 100,
                          ),
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }

  TextFormField buildBankNameTextFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      autocorrect: false,
      readOnly: true,
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.right,
      controller: bankNameController,
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
            child: bank_options(context),
          ),
        )
      },
      decoration: InputDecoration(
        hintText: 'انتخاب کنید',
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
  TextFormField buildBankCardNumberTextFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      autocorrect: false,
      readOnly: false,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.left,
      maxLength: 22,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        CardNumberFormatter(),
      ],
      style: const TextStyle(
          fontSize: 18.0,
          fontFamily: 'IRANSans',
          fontWeight: FontWeight.normal,
          height: 1.9),
      onChanged: (value) {},
      onTap: () => {

      },
      decoration: InputDecoration(
        hintText: 'XXXX XXXX XXXX XXXX',
        hintStyle: TextStyle(
            fontSize: 14.0, color: Colors.black26, fontWeight: FontWeight.bold, letterSpacing: 3.0),
        focusColor: Colors.white,
        errorText: null,
        counterText: "",
        errorStyle: TextStyle(
          fontSize: 4.0,
        ),
        fillColor: kPrimaryBackgroundColor,
        prefixStyle: TextStyle(color: Colors.grey),
      ),
    );
  }
  TextFormField buildShabaNumberTextFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      autocorrect: false,
      readOnly: false,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.left,
      maxLength: 24,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      style: const TextStyle(
          fontSize: 16.0,
          fontFamily: 'IRANSans',
          fontWeight: FontWeight.bold,
          height: 1.9),
      onChanged: (value) {},
      onTap: () => {

      },
      decoration: InputDecoration(
        hintText: '',
        hintStyle: TextStyle(
            fontSize: 14.0, color: Colors.black26, fontWeight: FontWeight.bold, letterSpacing: 3.0),
        focusColor: Colors.white,
        errorText: null,
        counterText: "",
        errorStyle: TextStyle(
          fontSize: 4.0,
        ),
        fillColor: kPrimaryBackgroundColor,
        prefixStyle: TextStyle(color: Colors.grey),
        prefixIcon: SizedBox(
          width: 25.0,
          child: Row(
            children: [
              Center(
                widthFactor: 1.5,
                child: Text(
                  'IR-',
                  style: TextStyle(
                      fontFamily: 'IRANSans',
                      fontWeight: FontWeight.w700,
                      fontSize: 22.0,
                      color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  TextFormField buildNameFamilyTextFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      autocorrect: false,
      readOnly: false,
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.right,
      maxLength: 100,
      inputFormatters: [
        FilteringTextInputFormatter.singleLineFormatter,
      ],
      style: const TextStyle(
          fontSize: 16.0,
          fontFamily: 'IRANSans',
          fontWeight: FontWeight.bold,
          height: 1.9),
      onChanged: (value) {},
      onTap: () => {

      },
      decoration: InputDecoration(
        hintText: '',
        hintStyle: TextStyle(
            fontSize: 14.0, color: Colors.black26, fontWeight: FontWeight.bold, letterSpacing: 3.0),
        focusColor: Colors.white,
        errorText: null,
        counterText: "",
        errorStyle: TextStyle(
          fontSize: 4.0,
        ),
        fillColor: kPrimaryBackgroundColor,
        prefixStyle: TextStyle(color: Colors.grey),
      ),
    );
  }
  TextFormField buildNationalCodeTextFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      autocorrect: false,
      readOnly: false,
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.left,
      maxLength: 10,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      style: const TextStyle(
          fontSize: 16.0,
          fontFamily: 'IRANSans',
          fontWeight: FontWeight.bold,
          height: 1.9),
      onChanged: (value) {},
      onTap: () => {

      },
      decoration: InputDecoration(
        hintText: '',
        hintStyle: TextStyle(
            fontSize: 14.0, color: Colors.black26, fontWeight: FontWeight.bold, letterSpacing: 3.0),
        focusColor: Colors.white,
        errorText: null,
        counterText: "",
        errorStyle: TextStyle(
          fontSize: 4.0,
        ),
        fillColor: kPrimaryBackgroundColor,
        prefixStyle: TextStyle(color: Colors.grey),
      ),
    );
  }

  Widget bank_options(BuildContext context) => ListView.builder(
    shrinkWrap: true,
    scrollDirection: Axis.vertical,
    itemCount:  banks.length,
    itemBuilder: (BuildContext context, int index){
      final Bank bank = banks[index];
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.0),
        child: Column(
          children: [
            BottomModalOption(
                label: bank.bankName,
                onTap: () => {
                  this.bankNameController.text = bank.bankName,
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
class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue previousValue,
      TextEditingValue nextValue,
      ) {
    var inputText = nextValue.text;

    if (nextValue.selection.baseOffset == 0) {
      return nextValue;
    }

    var bufferString = new StringBuffer();
    for (int i = 0; i < inputText.length; i++) {
      bufferString.write(inputText[i]);
      var nonZeroIndexValue = i + 1;
      if (nonZeroIndexValue % 4 == 0 && nonZeroIndexValue != inputText.length) {
        bufferString.write('  ');
      }
    }

    var string = bufferString.toString();
    return nextValue.copyWith(
      text: string,
      selection: new TextSelection.collapsed(
        offset: string.length,
      ),
    );
  }
}
