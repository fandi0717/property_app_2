import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:property_app/route/page_name.dart';

import '../../../utils/app_constants.dart';
import '../cubit/bottom_navbar_cubit.dart';

class BottomNavbarWidget extends StatelessWidget {
  const BottomNavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppConstants.WHITE,
      width: 428.w,
      height: 85.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomBottomNavBarWidget(index: 0, icon: 'home.svg'),
          CustomBottomNavBarWidget(index: 1, icon: 'building.svg'),
          CustomBottomNavBarWidget(index: 2, icon: 'document.svg'),
          CustomBottomNavBarWidget(index: 3, icon: 'cart.svg'),
          CustomBottomNavBarWidget(index: 4, icon: 'account.svg'),
        ],
      ),
    );
  }
}

class CustomBottomNavBarWidget extends StatelessWidget {
  const CustomBottomNavBarWidget({
    super.key,
    required this.index,
    required this.icon,
  });

  final int index;
  final String icon;

  final Map<int, String> mappingRoute = const {
    0: PageName.HOME,
    1: PageName.BUILDING,
    2: PageName.DOCUMENT,
    3: PageName.CART,
    4: PageName.ACCOUNT,
  };

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        // todo with index
        if (index != context.read<BottomNavbarCubit>().state) {
          context.read<BottomNavbarCubit>().changeIndex(index);
          Navigator.of(context)
              .pushReplacementNamed(mappingRoute.values.toList()[index]);
        }
      },
      child: BlocBuilder<BottomNavbarCubit, int>(
        builder: (context, state) {
          return SizedBox(
              width: 61.w,
              height: 55.h,
              child: index == state
                  ? Column(
                      children: [
                        // icon
                        SvgPicture.asset(
                          '${AppConstants.ICON_NAVBAR_ACTIVE}$icon',
                          width: 24.r,
                          height: 24.r,
                          colorFilter: const ColorFilter.mode(
                              AppConstants.DARK_OLIVE_GREEN, BlendMode.srcIn),
                        ),
                        // gap
                        Gap(20.h),

                        // indicator
                        SvgPicture.asset(
                          AppConstants.ICON_NAVBAR_INDICATOR,
                          width: 61.w,
                          height: 11.h,
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        // icon
                        SvgPicture.asset(
                            '${AppConstants.ICON_NAVBAR_NONACTIVE}$icon',
                            width: 24.r,
                            height: 24.r,
                            colorFilter: const ColorFilter.mode(
                                AppConstants.MEDIUM_GRAY, BlendMode.srcIn)),
                        // gap
                        Gap(20.h),

                        // indicator
                        SvgPicture.asset(
                          AppConstants.ICON_NAVBAR_INDICATOR,
                          width: 61.w,
                          height: 11.h,
                          colorFilter: const ColorFilter.mode(
                              Colors.transparent, BlendMode.srcIn),
                        ),
                      ],
                    ));
        },
      ),
    );
  }
}
