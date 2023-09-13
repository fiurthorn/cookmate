import 'package:cookmate/book/domain/repositories/disk_source.dart';
import 'package:cookmate/book/domain/usecases/usecase.dart';
import 'package:cookmate/core/lib/optional.dart';
import 'package:cookmate/core/lib/tuple.dart';
import 'package:cookmate/core/service_locator/service_locator.dart';
import 'package:flutter/foundation.dart';

export 'call.dart';

class ReadFilesParam {
  final List<String> path;

  ReadFilesParam(this.path);
}

typedef ReadFiles = UseCase<List<Tuple2<String, Uint8List>>, ReadFilesParam>;

class ReadFilesUseCase implements ReadFiles {
  @override
  Future<Optional<List<Tuple2<String, Uint8List>>>> call(ReadFilesParam param) async {
    try {
      return Optional.newValue(sl<DiskSource>().readFiles(param.path));
    } on Exception catch (e, st) {
      return Optional.newError(e, st);
    }
  }
}
