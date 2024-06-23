import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../utils/app_constants.dart';
import '../../widgets/custom_text_widget.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 378.w,
        height: 60.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // avatar and text
            SizedBox(
              width: 313.5.w,
              height: 60.h,
              child: Row(children: [
                // avatar
                Container(
                  width: 60.r,
                  height: 60.r,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // borderRadius: BorderRadius.circular(300.r),
                      border: Border.all(color: AppConstants.WHITE, width: 1.5),
                      color: AppConstants.CADET_BLUE,
                      image: const DecorationImage(
                          image: AssetImage(
                              '${AppConstants.IMAGES}profile_avatar.png'),
                          fit: BoxFit.cover)),
                ),

                // gap
                Gap(10.w),

                // text
                SizedBox(
                  width: 234.w,
                  height: 59.h,
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // text span
                      SizedBox(
                        width: 234.w,
                        height: 40.h,
                        child: Text.rich(TextSpan(
                            text: 'Temukan',
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                                height: 20 / 18,
                                // height: 1.1,
                                fontFamily: AppConstants.OUTFIT,
                                color: AppConstants.DARK_OLIVE_GREEN),
                            children: [
                              TextSpan(
                                  text: '\nHunian Impian',
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600,
                                      height: 20 / 18,
                                      // height: 1.1,
                                      fontFamily: AppConstants.OUTFIT,
                                      color: AppConstants.DARK_OLIVE_GREEN))
                            ])),
                      ),
                      Gap(4.h),

                      // text biasa
                      SizedBox(
                          width: 234.w,
                          height: 15.h,
                          child: const CustomTextWidget(
                              text: "Agen Properti Terbaik",
                              color: AppConstants.MEDIUM_GRAY_2))
                    ],
                  ),
                ),
              ]),
            ),

            // icon badge
            SizedBox(
              width: (378 - 313.5).w,
              height: 60.h,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 35.r,
                      height: 35.r,
                      padding: EdgeInsets.all(4.17.r),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppConstants.WHITE,
                      ),
                      child: SvgPicture.asset(
                          '${AppConstants.ICON_UTILS}notification.svg',
                          width: 20.r,
                          height: 20.r),
                    ),
                  ),
                  Positioned(
                    right: 5.w,
                    top: 4.h,
                    child: Container(
                        width: 24.r,
                        height: 24.r,
                        padding: EdgeInsets.symmetric(
                            vertical: 2.h, horizontal: 4.w),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppConstants.SALMON_PINK),
                        child: const Center(
                            child: CustomTextWidget(
                                text: "3",
                                size: 10.67,
                                weight: FontWeight.w500,
                                lineHeight: 13.44,
                                color: AppConstants.WHITE))),
                  )
                ],
              ),
            )

            /*
            icon badge
            badges.Badge(
              badgeContent: Container(
                width: 24.w,
                height: 24.h,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: Center(
                    child: Text(
                  "3",
                  style: TextStyle(
                      fontSize: 10.67.sp,
                      fontWeight: FontWeight.w500,
                      height: 13.44 / 10.67,
                      fontFamily: AppConstants.OUTFIT,
                      color: Colors.white),
                )),
              ),
              badgeStyle: badges.BadgeStyle(
                  badgeColor: Colors.red,
                  borderRadius: BorderRadius.circular(20.r),
                  padding:
                      EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w)),
              child: Container(
                  width: 35,
                  height: 35,
                  padding:
                      EdgeInsets.symmetric(horizontal: 4.7.w, vertical: 4.7.h),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      // borderRadius: BorderRadius.circular(18.51.r)
                      shape: BoxShape.circle),
                  child: SvgPicture.asset(
                      '${AppConstants.ICON_UTILS}notification.svg')),
            ),
            */
          ],
        ));
  }
}
