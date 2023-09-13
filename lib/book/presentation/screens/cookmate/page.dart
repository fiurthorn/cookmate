import 'package:cookmate/book/presentation/blocs/cookmate/bloc.dart';
import 'package:cookmate/book/presentation/screens/base.dart';
import 'package:cookmate/book/presentation/screens/base/template_page.dart';
import 'package:cookmate/core/widgets/goroute/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class CookmateScreen extends BaseScreen {
  const CookmateScreen({super.key});

  @override
  State<CookmateScreen> createState() => _CookmateScreenState();

  static const String path = '/cookmate';

  static AuthGoRoute get route => AuthGoRoute.unauthorized(
        path: path,
        child: (context, state) => const CookmateScreen(),
      );
}

class _CookmateScreenState extends TemplateBaseScreenState<CookmateScreen, CookmateBloc> {
  @override
  CookmateBloc createBloc(BuildContext context) => CookmateBloc();

  @override
  String title(BuildContext context) => "Cookmate";

  @override
  Widget buildScreen(BuildContext context) {
    return Container();
  }

  void dirty(BuildContext context) {
    final formBloc = BlocProvider.of<CookmateBloc>(context);
    formBloc.validate();
  }
}
