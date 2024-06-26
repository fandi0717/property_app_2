// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/bottom_navbar/widget/bottom_navbar_widget.dart';
import '../../../../injection_container.dart';
import '../../../../utils/app_constants.dart';
import '../bloc/property_bloc.dart';
import '../widgets/base_screen.dart';
import '../widgets/gap_screen.dart';
import 'section/ads.dart';
import 'section/body.dart';
import 'section/header.dart';

class PropertyScreen extends StatefulWidget {
  const PropertyScreen({super.key});
  @override
  State<PropertyScreen> createState() => _PropertyState();
}

class _PropertyState extends State<PropertyScreen> {
  late PropertyBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = getIt<PropertyBloc>();
    // _bloc.add(LoadPropertyEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => _bloc, child: const HomeScreen());
  }

  /*
  Widget _buildBody(PropertyState state) {
    if (state is PropertyLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is PropertyLoaded) {
      return ListView.builder(
        itemCount: state.property.property.length,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.blue,
            margin: const EdgeInsets.only(bottom: 10),
            child: Text("${state.property.property[index].name}"),
          );
        },
      ); // Replace with your actual widget
    } else if (state is PropertyError) {
      return Center(
        child: Text('Error: ${state.exception}'),
      );
    } else {
      return Container(
        color: Colors.red,
      );
    }
  }
  */
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: AppConstants.LIGHT_GRAY,
        body: BaseScreen(
            child: Column(
          children: [
            HeaderSection(),
            GapScreen(),
            AdsSection(),
            GapScreen(),
            Expanded(child: BodySection())
          ],
        )),
        bottomNavigationBar: BottomNavbarWidget());
  }
}
