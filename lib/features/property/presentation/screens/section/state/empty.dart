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
              color: Color.fromRGBO(158, 158, 158, 1),
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
        Text(
          'Pesanan Kosong',
          style: TextStyle(
              fontFamily: AppConstants.OUTFIT,
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
              height: 20.16 / 16,
              color: const Color.fromRGBO(51, 74, 52, 1)),
        ),
        Gap(4.h),
        Text(
          'Ayo tambahkan pesanan baru',
          style: TextStyle(
              fontFamily: AppConstants.OUTFIT,
              fontWeight: FontWeight.w400,
              fontSize: 12.sp,
              height: 15.12 / 12,
              color: const Color.fromRGBO(155, 155, 155, 1)),
        ),
        Gap(10.h),
        ElevatedButton.icon(
          onPressed: () {
            context.read<PropertyBloc>().add(LoadPropertyEvent());
          },
          label: Text(
            'Eksplor Properti',
            style: TextStyle(
                fontFamily: AppConstants.OUTFIT,
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                height: 20.16 / 16,
                color: const Color.fromRGBO(255, 255, 255, 1)),
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
                const WidgetStatePropertyAll(Color.fromRGBO(51, 74, 52, 1)),
            padding: WidgetStatePropertyAll(
                EdgeInsets.symmetric(vertical: 15.h, horizontal: 25.w)),
          ),
        ),
        // Container(
        //   width: 196.w,
        //   height: 50.h,
        //   decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(39).r,
        //       color: const Color.fromRGBO(51, 74, 52, 1)),
        //   padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25).r,
        //   child: Row(
        //     children: [
        //       SvgPicture.asset(
        //         '${AppConstants.ICON_UTILS}search.svg',
        //         width: 20.r,
        //         height: 20.r,
        //       ),
        //       Gap(10.w),
        //       Text(
        //         'Eksplor Properti',
        //         style: TextStyle(
        //             fontFamily: AppConstants.OUTFIT,
        //             fontWeight: FontWeight.w500,
        //             fontSize: 16.sp,
        //             height: 20.16 / 16,
        //             color: const Color.fromRGBO(255, 255, 255, 1)),
        //       )
        //     ],
        //   ),
        // )
      ],
    );
  }
}
