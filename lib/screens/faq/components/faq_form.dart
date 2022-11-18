import 'package:flutter/material.dart';
import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:yarsi/config/palette.dart';

class FaqForm extends StatelessWidget {
  const FaqForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _headerStyle = const TextStyle(
        color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold);
    final _contentStyle = const TextStyle(
        color: Colors.black, fontSize: 13, fontWeight: FontWeight.normal);
    final _loremIpsum =
    '''لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد. ''';
    return Container(
      child: Accordion(
        maxOpenSections: 1,
        headerBackgroundColorOpened: Color(0XFFDFBA70).withOpacity(0.5),
        contentBorderColor: Colors.white,
        scaleWhenAnimating: false,
        openAndCloseAnimation: true,
        headerPadding:
        const EdgeInsets.symmetric(vertical: 7, horizontal: 5),
        sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
        sectionClosingHapticFeedback: SectionHapticFeedback.light,
        children: [
          AccordionSection(
            isOpen: true,
            headerBackgroundColor: Palette.accordionColor,
            headerBackgroundColorOpened: Palette.accordionColor,
            header: Center(child: Text('پرسش اول', style: _headerStyle)),
            content: Directionality(textDirection: TextDirection.rtl, child: Text(_loremIpsum, style: _contentStyle)),
            contentHorizontalPadding: 5,
            contentBorderWidth: 1,
            // onOpenSection: () => print('onOpenSection ...'),
            // onCloseSection: () => print('onCloseSection ...'),
          ),
          AccordionSection(
            isOpen: false,
            headerBackgroundColor: Palette.accordionColor,
            headerBackgroundColorOpened: Palette.accordionColor,
            header: Center(child: Text('پرسش دوم', style: _headerStyle)),
            content: Directionality(textDirection: TextDirection.rtl, child: Text(_loremIpsum, style: _contentStyle)),
            contentHorizontalPadding: 5,
            contentBorderWidth: 1,
            // onOpenSection: () => print('onOpenSection ...'),
            // onCloseSection: () => print('onCloseSection ...'),
          ),
          AccordionSection(
            isOpen: false,
            headerBackgroundColor: Palette.accordionColor,
            headerBackgroundColorOpened: Palette.accordionColor,
            header: Center(child: Text('پرسش سوم', style: _headerStyle)),
            content: Directionality(textDirection: TextDirection.rtl, child: Text(_loremIpsum, style: _contentStyle)),
            contentHorizontalPadding: 5,
            contentBorderWidth: 1,
            // onOpenSection: () => print('onOpenSection ...'),
            // onCloseSection: () => print('onCloseSection ...'),
          ),
          AccordionSection(
            isOpen: false,
            headerBackgroundColor: Palette.accordionColor,
            headerBackgroundColorOpened: Palette.accordionColor,
            header: Center(child: Text('پرسش چهارم', style: _headerStyle)),
            content: Directionality(textDirection: TextDirection.rtl, child: Text(_loremIpsum, style: _contentStyle)),
            contentHorizontalPadding: 5,
            contentBorderWidth: 1,
            // onOpenSection: () => print('onOpenSection ...'),
            // onCloseSection: () => print('onCloseSection ...'),
          ),
          AccordionSection(
            isOpen: false,
            headerBackgroundColor: Palette.accordionColor,
            headerBackgroundColorOpened: Palette.accordionColor,
            header: Center(child: Text('پرسش پنجم', style: _headerStyle)),
            content: Directionality(textDirection: TextDirection.rtl, child: Text(_loremIpsum, style: _contentStyle)),
            contentHorizontalPadding: 5,
            contentBorderWidth: 1,
            // onOpenSection: () => print('onOpenSection ...'),
            // onCloseSection: () => print('onCloseSection ...'),
          ),
        ],
      ),
    );
  }
}
