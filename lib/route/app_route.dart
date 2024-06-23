import 'package:flutter/material.dart';

import '../features/account/presentation/screens/account_screen.dart';
import '../features/building/presentation/screens/building_screen.dart';
import '../features/cart/presentation/screens/cart_screen.dart';
import '../features/document/presentation/screens/document_screen.dart';
import '../features/property/presentation/screens/property_screen.dart';
import 'page_name.dart';

class AppRoute {
  static Route? onGenerateRoute(RouteSettings settings) {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          switch (settings.name) {
            case PageName.HOME:
              return const PropertyScreen();
            case PageName.BUILDING:
              return const BuildingScreen();
            case PageName.DOCUMENT:
              return const DocumentScreen();
            case PageName.CART:
              return const CartScreen();
            case PageName.ACCOUNT:
              return const AccountScreen();
            default:
              return const SizedBox.shrink();
          }
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
        settings: settings);
  }
}
