import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yarsi/components/components.dart';
import 'package:yarsi/widgets/dialog/dialogs/dialogs.dart';
import 'package:yarsi/widgets/multipleselect/multi_select_flutter.dart';
import 'package:yarsi/config/palette.dart';
import 'package:yarsi/config/size_config.dart';
import 'package:yarsi/data/data.dart';
import 'package:yarsi/models/models.dart';
import 'package:yarsi/widgets/widgets.dart';

class ProfileEdit extends StatefulWidget {
  static String routeName = "/profile-edit";

  const ProfileEdit({Key? key}) : super(key: key);

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  final _items = favorites
      .map((favorite) => MultiSelectItem<Favorite>(favorite, favorite.name))
      .toList();
  List<Object?> _selectedFavorites = [favorites[2], favorites[1]];
  final _multiSelectKey = GlobalKey<FormFieldState>();
  final TextEditingController nameFamilyController = TextEditingController();
  final TextEditingController ganderController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nationalCodeController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  int gander = 2;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final Size size = MediaQuery.of(context).size;
    final User user = onlineUsers[2];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(size.width, 100.0),
        child: SingleAppBar(
          onTap: () => {},
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              backgroundColor: Colors.transparent,
              pinned: false,
              floating: true,
              leading: Container(),
              automaticallyImplyLeading: false,
              iconTheme: IconThemeData(color: Colors.transparent),
              expandedHeight: MediaQuery.of(context).size.height * 0.35,
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
                              Column(
                                children: [
                                  NormalButton(
                                    text: "تصویر پروفایل",
                                    backgroundColor: kPrimaryBackgroundColor,
                                    press: () {},
                                    width: 100,
                                    height: 40,
                                    borderRadius: 25,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  NormalButton(
                                    text: "حذف تصویر",
                                    backgroundColor: kPrimaryBackgroundColor,
                                    press: () {},
                                    width: 100,
                                    height: 40,
                                    borderRadius: 25,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )),
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 15.0),
              child: ListView(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Palette.primaryLightColor.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Column(
                      children: <Widget>[
                        MultiSelectBottomSheetField(
                          initialChildSize: 0.6,
                          initialValue: _selectedFavorites,
                          listType: MultiSelectListType.CHIP,
                          searchable: true,
                          selectedColor:
                          Palette.primaryDarkColor.withOpacity(0.5),
                          unselectedColor:
                          Palette.primaryLightColor.withOpacity(0.5),
                          //backgroundColor: Palette.primaryLightBackground,
                          buttonText: Text(
                            "علاقمندی ها",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 12.0),
                          ),
                          title: Text(
                            "علاقمندی های خود را انتخاب کنید",
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
                          items: _items,
                          onConfirm: (values) {
                            setState(() {
                              _selectedFavorites = values;
                            });
                            print(_selectedFavorites);
                          },
                          chipDisplay: MultiSelectChipDisplay(
                            alignment: Alignment.center,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(5.0))),
                            icon: Icon(Icons.close_rounded),
                            onTap: (value) {
                              print(value);
                              setState(() {
                                _selectedFavorites.remove(value);
                              });
                            },
                          ),
                        ),
                        _selectedFavorites.length == 0 ||
                            _selectedFavorites.isEmpty
                            ? Container(
                            padding: EdgeInsets.all(10),
                            alignment: Alignment.centerRight,
                            child: Text(
                              "انتخابی نشده",
                              style: TextStyle(color: Colors.black54),
                            ))
                            : Container(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
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
                        Focus(
                            child: buildTextFormField(
                                "nameFamily",
                                TextDirection.rtl,
                                "",
                                nameFamilyController)
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Text(
                            'جنسیت',
                            style: TextStyle(
                                fontFamily: 'IRANSans',
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        Focus(child: buildGanderTextFormField()),
                        SizedBox(
                          height: 5.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Text(
                            'ایمیل',
                            style: TextStyle(
                                fontFamily: 'IRANSans',
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        Focus(
                            child: buildTextFormField(
                                "email",
                                TextDirection.rtl,
                                "",
                                emailController)
                        ),
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
                        Focus(
                            child: buildTextFormField(
                                "nationalCode",
                                TextDirection.rtl,
                                "",
                                nationalCodeController)
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Text(
                            'کدپستی',
                            style: TextStyle(
                                fontFamily: 'IRANSans',
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        Focus(
                            child: buildTextFormField(
                                "postalCode",
                                TextDirection.ltr,
                                "",
                                postalCodeController)
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Text(
                            'آدرس پستی',
                            style: TextStyle(
                                fontFamily: 'IRANSans',
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        Focus(
                            child: buildTextFormField(
                                "addredd",
                                TextDirection.ltr,
                                "",
                                addressController)
                        ),
                        SizedBox(
                          height: 45.0,
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
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  TextFormField buildTextFormField(
      String field,
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
  TextFormField buildEmailTextFormField(
      String field,
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
  TextFormField buildNationalCodeTextFormField(
      String field,
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

  TextFormField buildGanderTextFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      autocorrect: false,
      readOnly: true,
      controller: ganderController,
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.right,
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
            child: gander_options(context),
          ),
        )
      },
      decoration: InputDecoration(
        hintText: 'نامعلوم',
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

  Widget gander_options(BuildContext context) => SingleChildScrollView(
    child: Column(
      children: [
        BottomModalOption(
            label: 'مونث',
            onTap: () => {
              Navigator.pop(context),
              ganderController.text = 'مونث',
              setState(() {
                gander = 0;
              })
            }),
        DashedDivider(
          height: 1.0,
          color: Colors.grey,
        ),
        BottomModalOption(
          label: 'مذکر',
          onTap: () => {
            Navigator.pop(context),
            ganderController.text = 'مذکر',
            setState(() {
              gander = 1;
            })
          },
        ),
        DashedDivider(
          height: 1.0,
          color: Colors.grey,
        ),
        BottomModalOption(
          label: 'سایر',
          onTap: () => {
            Navigator.pop(context),
            ganderController.text = 'سایر',
            setState(() {
              gander = 2;
            })
          },
        ),
      ],
    ),
  );
}
