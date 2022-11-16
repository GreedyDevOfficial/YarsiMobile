import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yarsi/config/palette.dart';
import 'package:yarsi/data/data.dart';
import 'package:yarsi/models/models.dart';
import 'package:yarsi/widgets/widgets.dart';

import 'adv_card.dart';
import 'marketing_card.dart';


class ExploreViewMore extends StatefulWidget {
  static String routeName = "explore-view-more";

  const ExploreViewMore({Key? key}) : super(key: key);

  @override
  State<ExploreViewMore> createState() => _ExploreViewMoreState();
}

class _ExploreViewMoreState extends State<ExploreViewMore> {
  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(screenSize.width, 100.0),
          child: ExploreViewMoreAppBar(
            onTap: () => {},
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: screenSize.width,
              child: Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                child: Text(
                  'با مشاهده تبلیغات، سکه جایزه بگیرید',
                  style: TextStyle(
                      fontSize: 11.0,
                      fontWeight: FontWeight.w700,
                      color: Palette.primaryDarkColor),
                  textDirection: TextDirection.rtl,
                ),
              ),
            ),
            Container(
              height: 170,
              color: Colors.white70,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: posts.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Post post = posts[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.0),
                      child: AdvCard(post: post),
                    );
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 10.0),
                    child: Material(
                        color: Palette.primaryLightBackground,
                        borderRadius: BorderRadius.circular(50.0),
                        child: InkWell(
                            borderRadius: BorderRadius.circular(50.0),
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
                                  heightFactor: 0.4,
                                  child: marketing_filter_options(context),
                                ),
                              )
                            },
                            child: Icon(
                              FontAwesomeIcons.filter,
                              size: 15.0,
                              color: Palette.primaryDarkColor,
                            )))),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 10.0),
                  child: Text(
                    arguments['type'],
                    style: TextStyle(
                        fontSize: 11.0,
                        fontWeight: FontWeight.w700,
                        color: Palette.primaryDarkColor),
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: GridView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final Post post = posts[index];
                    return MarketingCard(post: post,);
                  } ,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 1,
                  ),
                ),
              ),
            )
          ],
        )
    );
  }
  Widget marketing_filter_options(BuildContext context) => SingleChildScrollView(
    child: Column(
      children: [
        BottomModalOption(
            label: 'بیشترین خرید',
            onTap: () => {

            }),
        DashedDivider(
          height: 1.0,
          color: Colors.grey,
        ),
        BottomModalOption(
          label: 'بیشترین امتیاز',
          onTap: () => {
          },
        ),
      ],
    ),
  );
}
