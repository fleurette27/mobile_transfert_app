import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile_transfert_app/utils/app_colors.dart';

Widget text30Normal({String text=" ",Color color= AppColors.primaryText }) {
  return Text(
     text,
    style: TextStyle(
      color:color,
      fontSize: 30,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget text16Normal({String text=" ",Color color=AppColors.primarySecondaryElementText}) {
  return Text(
     text,
    style: TextStyle(
      color:color,
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
  );
}