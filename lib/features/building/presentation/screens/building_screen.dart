import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../property/presentation/widgets/custom_text_widget.dart';
import '../../../../core/bottom_navbar/widget/bottom_navbar_widget.dart';
import '../../../../injection_container.dart';
import '../bloc/building_bloc.dart';

class BuildingScreen extends StatefulWidget {
  const BuildingScreen({super.key});
  @override
  State<BuildingScreen> createState() => _BuildingState();
}

class _BuildingState extends State<BuildingScreen> {
  late BuildingBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = getIt<BuildingBloc>();
    _bloc.add(const BuildingEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => _bloc,
        child: const Scaffold(
          body: Center(
            child: CustomTextWidget(text: 'Building Screen'),
          ),
          bottomNavigationBar: BottomNavbarWidget(),
        ));
  }
}
