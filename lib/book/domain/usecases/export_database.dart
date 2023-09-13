import 'package:cookmate/book/domain/repositories/key_values.dart';
import 'package:cookmate/book/domain/usecases/usecase.dart';
import 'package:cookmate/core/lib/optional.dart';
import 'package:cookmate/core/service_locator/service_locator.dart';

export 'call.dart';

class ExportDatabaseParam {
  ExportDatabaseParam();
}

typedef ExportDatabase = UseCase<bool, ExportDatabaseParam>;

class ExportDatabaseUseCase implements ExportDatabase {
  @override
  Future<Optional<bool>> call(ExportDatabaseParam param) async {
    try {
      return sl<KeyValues>().exportDatabase().then((value) => Optional.newValue(true));
    } on Exception catch (e, st) {
      return Optional.newError(e, st);
    }
  }
}
