import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yarsi/config/palette.dart';
import 'package:yarsi/data/data.dart';
import 'package:yarsi/widgets/widgets.dart';
class ExploreSearch extends StatelessWidget {

  static String routeName = "explore-search";


  const ExploreSearch({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final Size screenSize = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        appBar:  PreferredSize(
          preferredSize: Size(screenSize.width, 100.0),
          child: SingleAppBar(onTap: () =>  {
          },),
        ) ,
        body: Column(
            children: [
              SizedBox(height: 10,),
              Focus(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35.0),
                    child: buildTextFormField("filter", Icons.search,
                        TextDirection.rtl, "عبارت مورد نظر را برای جستجو بنویسید"),
                  )
              ),
              SizedBox(height: 10.0,),
              Wrap(
                alignment: WrapAlignment.center,
                children: [
                  for ( var i in hashTags ) Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Palette.primaryLightColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(i.title + "#", style: TextStyle(color: Colors.black, fontSize: 10.0, fontWeight: FontWeight.w700),),
                      ),
                    ),
                  )
                ],
              )
            ]
        )
    );
  }
  TextFormField buildTextFormField(
      String field, IconData icon, TextDirection direction, String hintText) {
    return TextFormField(
      keyboardType: TextInputType.name,
      autocorrect: false,
      textDirection: direction,
      textAlign: TextAlign.right,
      inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
      onSaved: (newValue) => field = newValue!,
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
}
