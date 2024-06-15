import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:property_app/features/property/presentation/bloc/property_bloc.dart';

class GapScreen extends StatelessWidget {
  const GapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PropertyBloc, PropertyState>(
      builder: (context, state) {
        if (state is PropertyInitial) {
          return Gap(30.h);
        }
        return Gap(25.h);
      },
    );
  }
}
