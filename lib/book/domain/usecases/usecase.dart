import 'dart:async';

import 'package:cookmate/core/lib/optional.dart';

abstract class UseCase<Result, Param> {
  Future<Optional<Result>> call(Param param);
}

abstract class UseCaseStream<Result, Param> {
  Stream<Result> call(Param param);
}

abstract class UseCaseCompleter<Result, Param> {
  Completer<Result> call(Param param);
}
