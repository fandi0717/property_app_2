import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:property_app/features/property/presentation/bloc/property_bloc.dart';
import 'package:property_app/features/property/presentation/screens/section/state/eksplor.dart';
import 'package:property_app/features/property/presentation/screens/section/state/empty.dart';

class BodySection extends StatelessWidget {
  const BodySection({super.key});

  @override
  Widget build(BuildContext context) {
    print("50.spMin : ${50.spMin}");
    print("50.h : ${50.h}");
    print("50.r : ${50.r}");
    print("berapa sp 18 : ${18.sp}");
    print("berapa height 22.68 / 18 : ${22.68 / 18}");
    print("berapa height 22.68 / 18.sp : ${22.68 / 18.sp}");
    print("berapa height 22.68.sp / 18.sp : ${22.68.sp / 18.sp}");
    return Container(
      width: 378.w,
      // height: 571.h,
      child: BlocBuilder<PropertyBloc, PropertyState>(
        builder: (context, state) {
          if (state is PropertyLoaded) {
            return EksplorProperti(state: state);
          }
          return EmptyProperty();
        },
      ),
    );
  }
}
