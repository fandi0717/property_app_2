import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/bottom_navbar/widget/bottom_navbar_widget.dart';
import '../../../../injection_container.dart';
import '../../../property/presentation/widgets/custom_text_widget.dart';
import '../bloc/document_bloc.dart';

class DocumentScreen extends StatefulWidget {
  const DocumentScreen({super.key});
  @override
  State<DocumentScreen> createState() => _DocumentState();
}

class _DocumentState extends State<DocumentScreen> {
  late DocumentBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = getIt<DocumentBloc>();
    _bloc.add(const DocumentEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => _bloc,
        child: const Scaffold(
          body: Center(
            child: CustomTextWidget(text: 'Document Screen'),
          ),
          bottomNavigationBar: BottomNavbarWidget(),
        ));
  }
}
