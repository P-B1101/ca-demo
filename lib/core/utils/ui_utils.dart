import 'dart:convert';

import 'package:flutter/material.dart';

import 'enums.dart';

class UiUtils {
  const UiUtils._();

  static const duration = Duration(milliseconds: 300);

  static const curve = Curves.ease;

  static const maxInputSize = 304.0;
  static const loginInputSize = 324.0;

  static const dialogWidth = 600.0;

  static const dropDownMaxHeight = 360.0;

  static const menuWidth = 182.0;

  static const horizontalPadding = 24.0;
  
  static const borderRadius = 16.0;
  
  static const bottomAppBarHeight = 60.0;

  

  static const mainTabs = [
    AppTab.dashboard,
    AppTab.budgets,
    AppTab.events,
    AppTab.cards,
  ];
}

class Utils {
  const Utils._();
  static const authorizationName = 'Authorization';
  static const contentTypeName = 'Content-Type';

  static const contentTypeValue = 'application/json; charset=utf-8';
  static final Encoding? utf8 = Encoding.getByName('utf-8');
}
