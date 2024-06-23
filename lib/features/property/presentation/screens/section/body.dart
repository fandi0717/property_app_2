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
    return SizedBox(
      width: 378.w,
      // height: 571.h,
      child: BlocBuilder<PropertyBloc, PropertyState>(
        builder: (context, state) {
          if (state is PropertyLoaded) {
            return EksplorProperti(state: state);
          }
          return const EmptyProperty();
        },
      ),
    );
  }
}
