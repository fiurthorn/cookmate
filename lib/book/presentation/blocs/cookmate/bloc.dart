import 'dart:async';

import 'package:cookmate/core/lib/optional.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

part 'state.dart';

class CookmateBloc extends FormBloc<String, ErrorValue> {
  AttachState get main => (state.groupFieldBlocOf("main")! as AttachState);

  CookmateBloc() {
    addFieldBlocs(fieldBlocs: [
      AttachState(),
    ]);
  }

  Future<bool> validate() {
    return main.validate();
  }

  @override
  FutureOr<void> onSubmitting() async {
    try {} on Exception catch (err, stack) {
      emitFailure(failureResponse: ErrorValue(err, stack));
    }
  }
}
