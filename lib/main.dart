import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:property_app/features/property/presentation/screens/property_screen.dart';

import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Future.wait([
    ServiceLocator().setup(),
  ]).then((value) {
    runApp(const MainApp());
  });
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      // ensureScreenSize: true,
      // minTextAdapt: true,
      // splitScreenMode: true,
      builder: (context, child) {
        return const MaterialApp(
            debugShowCheckedModeBanner: false, home: PropertyScreen());
      },
    );

    // return const ScreenUtilSingleton(
    //   options: ScreenUtilOptions(
    //     designSize: Size(428, 926),
    //     // fontFactorByWidth: 2.0,
    //     // fontFactorByHeight: 1.0,
    //     // flipSizeWhenLandscape: true,
    //   ),
    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     home: PropertyScreen(),
    //   ),
    // );
  }
}
