import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

Widget DiscountQRCode(BuildContext context, String code) {
  return Center(
    child: QrImage(
      data: code,
      version: QrVersions.auto,
      size: 250,
      gapless: false,
    )
  );
}
