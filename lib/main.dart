import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/bottom_navbar/cubit/bottom_navbar_cubit.dart';
import 'injection_container.dart';
import 'route/app_route.dart';

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
      minTextAdapt: true,
      // ensureScreenSize: true,
      // splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => BottomNavbarCubit(),
            )
          ],
          child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRoute.onGenerateRoute,
          ),
        );
      },
    );
  }
}
