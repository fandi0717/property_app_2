// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:property_app/features/property/presentation/screens/section/ads.dart';
import 'package:property_app/features/property/presentation/screens/section/body.dart';
import 'package:property_app/features/property/presentation/screens/section/header.dart';
import 'package:property_app/features/property/presentation/widgets/base_screen.dart';
import 'package:property_app/features/property/presentation/widgets/gap_screen.dart';
import 'package:property_app/utils/app_constants.dart';

import '../../../../core/bottom_navbar/cubit/bottom_navbar_cubit.dart';
import '../../../../injection_container.dart';
import '../bloc/property_bloc.dart';

class PropertyScreen extends StatefulWidget {
  const PropertyScreen({super.key});
  @override
  State<PropertyScreen> createState() => _PropertyState();
}

class _PropertyState extends State<PropertyScreen> {
  late PropertyBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = getIt<PropertyBloc>();
    // _bloc.add(LoadPropertyEvent());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => _bloc,
      ),
      BlocProvider(
        create: (context) => BottomNavbarCubit(),
      ),
    ], child: const HomeScreen());
  }

  Widget _buildBody(PropertyState state) {
    if (state is PropertyLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is PropertyLoaded) {
      return ListView.builder(
        itemCount: state.property.property.length,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.blue,
            margin: const EdgeInsets.only(bottom: 10),
            child: Text("${state.property.property[index].name}"),
          );
        },
      ); // Replace with your actual widget
    } else if (state is PropertyError) {
      return Center(
        child: Text('Error: ${state.exception}'),
      );
    } else {
      return Container(
        color: Colors.red,
      );
    }
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // context.su();
    return Scaffold(
        backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
        body: const BaseScreen(
            child: Column(
          children: [
            HeaderSection(),
            GapScreen(),
            AdsSection(),
            GapScreen(),
            Expanded(child: BodySection())
          ],
        )),
        bottomNavigationBar: Container(
          color: Colors.white,
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
        ));
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        // todo with index
        if (index != context.read<BottomNavbarCubit>().state) {
          context.read<BottomNavbarCubit>().changeIndex(index);
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
                              Color.fromRGBO(51, 74, 52, 1), BlendMode.srcIn),
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
                                Color.fromRGBO(155, 155, 155, 1),
                                BlendMode.srcIn)),
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
