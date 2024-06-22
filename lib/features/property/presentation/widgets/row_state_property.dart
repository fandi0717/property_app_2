// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:property_app/features/property/presentation/widgets/custom_text_widget.dart';

import 'package:property_app/utils/app_constants.dart';

class RowStatePropertyWidget extends StatelessWidget {
  RowStatePropertyWidget({
    super.key,
    this.icon,
    this.text,
    this.price,
  }) {
    if (price != null) {
      assert(icon == null, "Icon Tidak Boleh Diisi");
      assert(text == null, "text Tidak Boleh Diisi");
    }
  }
  final String? icon;
  final String? text;
  final String? price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: price != null
          ?
          /*
          [
              RichText(
                text: TextSpan(
                    text: 'Rp',
                    style: TextStyle(
                        fontFamily: AppConstants.OUTFIT,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: const Color.fromRGBO(51, 74, 52, 1),
                        height: 15.12 / 12),
                    children: [
                      TextSpan(
                          text: ' ',
                          style: TextStyle(
                              fontFamily: AppConstants.OUTFIT,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              height: 17.64 / 14)),
                      TextSpan(
                          text: convertToIntIfPossible(price!).toString(),
                          style: TextStyle(
                              fontFamily: AppConstants.OUTFIT,
                              fontWeight: FontWeight.w700,
                              fontSize: 14.sp,
                              height: 17.64 / 14))
                    ]),
              )
            ]
          */
          [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CustomTextWidget(
                    text: 'Rp',
                  ),
                  const CustomTextWidget(
                    text: ' ',
                    weight: FontWeight.w500,
                    size: 14,
                    lineHeight: 17.64,
                  ),
                  CustomTextWidget(
                    // text: convertToIntIfPossible(price!).toString(),
                    text: price ?? "",
                    weight: FontWeight.w700,
                    size: 14,
                    lineHeight: 17.64,
                  ),
                ],
              )
            ]
          : [
              SvgPicture.asset(
                '${AppConstants.ICON_UTILS}$icon',
                width: 14.r,
                height: 14.r,
                colorFilter: const ColorFilter.mode(
                    Color.fromRGBO(51, 74, 52, 1), BlendMode.srcIn),
              ),
              Gap(5.w),
              CustomTextWidget(text: text ?? ""),
            ],
    );
  }
}
