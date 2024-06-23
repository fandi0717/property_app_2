import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/bottom_navbar/widget/bottom_navbar_widget.dart';
import '../../../../injection_container.dart';
import '../../../property/presentation/widgets/custom_text_widget.dart';
import '../bloc/cart_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});
  @override
  State<CartScreen> createState() => _CartState();
}

class _CartState extends State<CartScreen> {
  late CartBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = getIt<CartBloc>();
    _bloc.add(const CartEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => _bloc,
        child: const Scaffold(
          body: Center(
            child: CustomTextWidget(text: 'Cart Screen'),
          ),
          bottomNavigationBar: BottomNavbarWidget(),
        ));
  }
}
