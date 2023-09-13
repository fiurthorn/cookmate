import 'package:cookmate/book/presentation/screens/base.dart';
import 'package:cookmate/book/presentation/screens/base/right_menu.dart';
import 'package:cookmate/book/presentation/screens/base/top_nav.dart';
import 'package:cookmate/core/lib/optional.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

abstract class TemplateBaseScreenState<T extends StatefulWidget, F extends FormBloc<String, ErrorValue>>
    extends FormBlocBaseScreenState<T, F> {
  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) => FullTopNavBar(title: title(context), refresh: update);

  @override
  Widget? buildEndDrawer(BuildContext context) => RightMenu(refresh: update);
}
