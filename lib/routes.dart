import 'package:flutter/material.dart';
import 'package:yarsi/screens/screens.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName : (context) => LoginScreen(),
  RegisterScreen.routeName : (context) => RegisterScreen(),
  OTPPasswordScreen.routeName : (context) => OTPPasswordScreen(),
  ForgetPasswordScreen.routeName : (context) => ForgetPasswordScreen(),
  NewPasswordScreen.routeName : (context) => NewPasswordScreen(),
  UpgradeScreen.routeName : (context) => UpgradeScreen(),
  CoinsScreen.routeName : (context) => CoinsScreen(),
  ChatScreen.routeName : (context) => ChatScreen(),
  AboutUsScreen.routeName : (context) => AboutUsScreen(),
  DiscountsScreen.routeName : (context) => DiscountsScreen(),
  FaqScreen.routeName : (context) => FaqScreen(),
  WalletScreen.routeName : (context) => WalletScreen(),
  DebitCards.routeName : (context) => DebitCards(),
  RegisterDiscountScreen.routeName : (context) => RegisterDiscountScreen(),
  ScanQRCodeScreen.routeName : (context) => ScanQRCodeScreen(),
};