// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:property_app/utils/app_constants.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    super.key,
    required this.text,
    this.fontFamily = AppConstants.OUTFIT,
    this.size = 12,
    this.lineHeight = 15.12,
    this.weight = FontWeight.w400,
    this.color = const Color.fromRGBO(51, 74, 52, 1),
  });

  /// `text` : [required]
  ///
  /// ex : "hello world"
  final String text;

  /// `fontFamily` : [Optional]
  ///
  /// ex : AppConstants.OUTFIT
  final String fontFamily;

  /// `size` : [Optional]
  ///
  /// size in figma
  ///
  /// ex : 12
  final double size;

  /// `lineHeight` : [Optional]
  ///
  /// lineHeight in figma
  ///
  /// ex : 15.12
  final double lineHeight;

  /// `weight` : [Optional]
  ///
  /// fontWeight of text
  ///
  /// ex : FontWeight.w400
  final FontWeight weight;

  /// `color` : [Optional]
  ///
  /// color of text
  ///
  /// ex : Color.fromRGBO(51,74,52,1)
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: fontFamily,
          fontSize: size.sp,
          fontWeight: weight,
          color: color,
          height: lineHeight / size),
    );
  }
}
