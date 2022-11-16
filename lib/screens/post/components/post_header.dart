import 'package:flutter/material.dart';
import 'package:yarsi/components/components.dart';
import 'package:yarsi/config/palette.dart';
import 'package:yarsi/config/size_config.dart';
import 'package:yarsi/models/models.dart';
import 'package:yarsi/widgets/widgets.dart';

class PostHeader extends StatelessWidget {
  final Post post;
  const PostHeader({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Row(
      children: [
        Container(
          height: 40.0,
          width: 40.0,
          child: Card(
            clipBehavior: Clip.antiAlias,
            shape: CircleBorder(),
            child: Container(
              child: InkWell(
                highlightColor: Colors.amberAccent,
                borderRadius: BorderRadius.circular(15.0),
                customBorder: CircleBorder(),
                child: IconButton(
                  splashRadius: 15.0,
                  onPressed: () => {
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
                        child: home_options(context),
                      ),
                    )
                  },
                  icon: const Icon(
                    Icons.more_vert,
                    size: 17,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  post.user.name,
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ],
            )),
        const SizedBox(
          width: 8.0,
        ),
        ProfileAvatar(imageUrl: post.user.imageUrl),
      ],
    );
  }

}

Widget home_options(BuildContext context) => Column(
  children: [
    BottomModalOption(
        label: 'ری پست',
        onTap: () => {Navigator.pop(context), showRepostDialog(context)}),
    DashedDivider(
      height: 1.0,
      color: Colors.grey,
    ),
    BottomModalOption(
      label: 'گزارش تخلف',
      onTap: () => {Navigator.pop(context), showReportDialog(context)},
    ),
    DashedDivider(
      height: 1.0,
      color: Colors.grey,
    ),
    BottomModalOption(
      label: 'اشتراک گذاری',
      onTap: () => {print('Sharing')},
    ),
    DashedDivider(
      height: 1.0,
      color: Colors.grey,
    ),
    BottomModalOption(
      label: 'دریافت کد تخفیف',
      onTap: () => {Navigator.pop(context), showDiscountCouponDialog(context)},
    ),
    DashedDivider(
      height: 1.0,
      color: Colors.grey,
    ),
    BottomModalOption(
      label: 'پیام شخصی',
      onTap: () => {Navigator.pop(context), showMessageDialog(context)},
    ),
  ],
);

