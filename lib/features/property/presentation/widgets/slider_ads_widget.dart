// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:property_app/utils/functions.dart';

import '../../../../utils/app_constants.dart';

class SliderAdsWidget extends StatelessWidget {
  const SliderAdsWidget({
    super.key,
    required this.index,
    this.backgroundColor = const Color.fromRGBO(51, 74, 52, 1),
    this.textColor = const Color.fromRGBO(255, 255, 255, 1),
    this.content = const {
      "diskon": 20.0,
      "nameProperty": "American House",
      "periode": "Periode 19 Nov 2023 s/d 15 Des 2023"
    },
    this.img = "${AppConstants.IMAGES}american_house.png",
  });

  final int index;
  final Color backgroundColor;
  final Color textColor;

  /// [content]
  ///
  /// `content[diskon] : double`
  ///
  /// `content[nameProperty] : String`
  ///
  /// `content[periode] : String`
  final Map<String, dynamic> content;
  final String img;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("slider ads tap on index : $index");
      },
      child: Container(
          // width: 358.w,
          // height: 155.h,
          margin: EdgeInsets.only(right: 15.r),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: backgroundColor),
          child: Row(
            children: [
              // text
              Padding(
                // padding: EdgeInsets.all(30.r),
                padding: const EdgeInsets.only(left: 30, top: 30, bottom: 30).r,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      style: TextStyle(color: textColor),
                      TextSpan(
                          text: '${convertToIntIfPossible(content["diskon"])}%',
                          style: TextStyle(
                              fontFamily: AppConstants.RUBIK,
                              fontWeight: FontWeight.w600,
                              fontSize: 18.sp,
                              height: 21.33 / 18),
                          children: [
                            TextSpan(
                              text: ' ',
                              style: TextStyle(
                                  fontFamily: AppConstants.OUTFIT,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15.sp,
                                  height: 18.9 / 15),
                            ),
                            TextSpan(
                                text: 'Diskon',
                                style: TextStyle(
                                  fontFamily: AppConstants.OUTFIT,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15.sp,
                                  height: 18.9 / 15,
                                ))
                          ]),
                    ),
                    Gap(7.h),
                    Text(
                      content["nameProperty"],
                      style: TextStyle(
                          fontFamily: AppConstants.OUTFIT,
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp,
                          height: 25.2 / 20,
                          color: textColor),
                    ),
                    Gap(4.h),
                    Row(
                      children: [
                        SvgPicture.asset(
                          "${AppConstants.ICON_UTILS}calendar.svg",
                          width: 12.r,
                          height: 12.r,
                        ),
                        Gap(5.w),
                        Text(
                          content["periode"],
                          style: TextStyle(
                              fontFamily: AppConstants.OUTFIT,
                              fontWeight: FontWeight.w300,
                              fontSize: 10.sp,
                              height: 12.6 / 10,
                              color: textColor),
                        )
                      ],
                    )
                  ],
                ),
              ),

              // img
              Expanded(
                  child: Transform.translate(
                offset: Offset(0, 10.h),
                child: Image.asset(img),
              ))
            ],
          )),
    );
  }
}
