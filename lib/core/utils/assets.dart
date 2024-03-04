import 'package:flutter/material.dart';

class Fonts {
  const Fonts._();
  static const icomoon = 'Icomoon';

  static const budgets = IconData(0xe900, fontFamily: icomoon);
  static const dashboard = IconData(0xe901, fontFamily: icomoon);
  static const cards = IconData(0xe902, fontFamily: icomoon);
  static const events = IconData(0xe903, fontFamily: icomoon);
  static const settings = IconData(0xe904, fontFamily: icomoon);
  static const entertainment = IconData(0xe905, fontFamily: icomoon);
  static const fingerprint = IconData(0xe906, fontFamily: icomoon);
  static const car = IconData(0xe907, fontFamily: icomoon);
  static const plus = IconData(0xe908, fontFamily: icomoon);
}

class MTextStyle {
  const MTextStyle._();

  static const titleStyle = TextStyle(
    fontSize: 16,
    color: MColors.notSelectedTextColor,
    fontWeight: FontWeight.w200,
  );

  static const title2Style = TextStyle(
    fontSize: 14,
    color: MColors.notSelectedTextColor,
    fontWeight: FontWeight.w300,
  );

  static const boldTitleStyle = TextStyle(
    fontSize: 20,
    color: MColors.textColor,
    fontWeight: FontWeight.w800,
  );

  static const subTitleStyle = TextStyle(
    fontSize: 13,
    color: MColors.progressBackgroundColor,
    fontWeight: FontWeight.w200,
  );
  
  static const subTitle2Style = TextStyle(
    fontSize: 13,
    color: MColors.notSelectedTextColor,
    fontWeight: FontWeight.w400,
  );
}

class MColors {
  const MColors._();

  static const primaryColor = Color(0xFF1C1C24);
  static const whiteColor = Color(0xFFFFFFFF);
  static const textColor = Color(0xFFFEFFFF);
  static const navigatorColor = Color(0xFF424153);
  static const cardColor = Color(0xFF262630);
  static const categoryColor1 = Color(0xFFAE7DFF);
  static const categoryColor2 = Color(0xFFFB8160);
  static const categoryColor3 = Color(0xFF03FCDC);
  static const notSelectedTextColor = Color(0xFFA9A8BA);
  static const progressBackgroundColor = Color(0xFF4F4E5C);
  static const thumbColor = Color(0xFFFED96A);
  static const plusGradientStartColor = Color(0xFFFE7763);
  static const plusGradientEndColor = Color(0xFFFF865D);
}
