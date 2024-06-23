import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/bottom_navbar/widget/bottom_navbar_widget.dart';
import '../../../../injection_container.dart';
import '../../../property/presentation/widgets/custom_text_widget.dart';
import '../bloc/account_bloc.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});
  @override
  State<AccountScreen> createState() => _AccountState();
}

class _AccountState extends State<AccountScreen> {
  late AccountBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = getIt<AccountBloc>();
    _bloc.add(const AccountEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => _bloc,
        child: const Scaffold(
          body: Center(
            child: CustomTextWidget(text: 'Account Screen'),
          ),
          bottomNavigationBar: BottomNavbarWidget(),
        ));
  }
}
