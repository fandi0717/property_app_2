// ignore_for_file: slash_for_doc_comments

import 'package:get_it/get_it.dart';
import 'package:property_app/features/account/inject_account.dart';
import 'package:property_app/features/building/inject_building.dart';
import 'package:property_app/features/cart/inject_cart.dart';
import 'package:property_app/features/document/inject_document.dart';
import 'package:property_app/features/property/inject_property.dart';

final GetIt getIt = GetIt.instance;

// how to use
/**
 * Future.wait([
    ServiceLocator().setup(),
    ]).then((value) {
    runApp(const MyApp());
    });
 * **/
class ServiceLocator {
  Future<void> setup() async {
    await injectProperty();
    await injectBuilding();
    await injectDocument();
    await injectCart();
    await injectAccount();
  }
}
