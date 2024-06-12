import 'package:flutter/material.dart';
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
    return const MaterialApp(home: PropertyScreen());
  }
}
