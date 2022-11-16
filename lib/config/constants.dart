const kAnimationDuration = Duration(milliseconds: 200);



const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kMobileNullError = "لطفا شماره موبایل خود را وارد کنید";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "لطفا گذرواژه خود را وارد نمایید";
const String kShortPassError = "گذر واژه خیلی کوتاه می باشد";
const String kMatchPassError = "گذرواژه ها تطابق ندارد";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";


class SLPConstants {
  /// Default latitude used by the picker.
  static const double DEFAULT_LATITUDE = 35.759983006349415;

  /// Default longitude used by the picker.
  static const double DEFAULT_LONGITUDE = 51.48246592884776;

  /// Default zoom level used by the picker.
  static const double DEFAULT_ZOOM_LEVEL = 16.0;
}