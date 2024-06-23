// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:property_app/features/property/presentation/widgets/custom_text_widget.dart';
import 'package:property_app/utils/functions.dart';

import '../../../../utils/app_constants.dart';

class SliderAdsWidget extends StatelessWidget {
  const SliderAdsWidget({
    super.key,
    required this.index,
    this.backgroundColor = AppConstants.DARK_OLIVE_GREEN,
    this.textColor = AppConstants.WHITE,
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
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: CustomTextWidget(
          text:
              "You tapped ads in index $index with name ${content["nameProperty"]}",
        )));
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
                    CustomTextWidget(
                      text: content["nameProperty"],
                      weight: FontWeight.w500,
                      size: 20,
                      lineHeight: 25.2,
                      color: textColor,
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
                        CustomTextWidget(
                          text: content["periode"],
                          weight: FontWeight.w300,
                          size: 10,
                          lineHeight: 12.6,
                          color: textColor,
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
