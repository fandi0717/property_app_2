import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:property_app/features/property/presentation/bloc/property_bloc.dart';
import 'package:property_app/features/property/presentation/widgets/custom_text_widget.dart';

import '../../../../../../utils/app_constants.dart';

class EmptyProperty extends StatelessWidget {
  const EmptyProperty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Align(
            alignment: Alignment.centerLeft,
            child: CustomTextWidget(
              text: 'Pesanan Terbaru',
              weight: FontWeight.w500,
              size: 18,
              lineHeight: 22.68,
            )),
        const Align(
            alignment: Alignment.centerLeft,
            child: CustomTextWidget(
              text: 'Daftar pesanan terbaru anda',
              color: AppConstants.SILVER,
            )),
        Gap(60.h),
        Expanded(
          child: Image.asset(
            '${AppConstants.IMAGES}background_empty.png',
            // scale: 2,
            width: 318.76.w,
            height: 196.66.h,
          ),
        ),
        Gap(20.h),
        const CustomTextWidget(
          text: 'Pesanan Kosong',
          weight: FontWeight.w600,
          size: 16,
          lineHeight: 20.16,
        ),
        Gap(4.h),
        const CustomTextWidget(
          text: 'Ayo tambahkan pesanan baru',
          color: AppConstants.MEDIUM_GRAY,
        ),
        Gap(10.h),
        ElevatedButton.icon(
          onPressed: () {
            context.read<PropertyBloc>().add(LoadPropertyEvent());
          },
          label: const CustomTextWidget(
            text: 'Eksplor Properti',
            weight: FontWeight.w500,
            size: 16,
            lineHeight: 20.16,
            color: AppConstants.WHITE,
          ),
          icon: SvgPicture.asset(
            '${AppConstants.ICON_UTILS}search.svg',
            width: 20.r,
            height: 20.r,
          ),
          style: ButtonStyle(
            minimumSize: WidgetStatePropertyAll(Size(196.w, 50.h)),
            // fixedSize: WidgetStatePropertyAll(Size(196.w, 50.h)),
            backgroundColor:
                const WidgetStatePropertyAll(AppConstants.DARK_OLIVE_GREEN),
            padding: WidgetStatePropertyAll(
                EdgeInsets.symmetric(vertical: 15.h, horizontal: 25.w)),
          ),
        ),
      ],
    );
  }
}
