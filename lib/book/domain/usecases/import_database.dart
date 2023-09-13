import 'package:cookmate/book/domain/repositories/key_values.dart';
import 'package:cookmate/book/domain/usecases/usecase.dart';
import 'package:cookmate/core/lib/optional.dart';
import 'package:cookmate/core/service_locator/service_locator.dart';

export 'call.dart';

class ImportDatabaseParam {
  final Map<dynamic, dynamic> map;
  ImportDatabaseParam(this.map);
}

typedef ImportDatabase = UseCase<bool, ImportDatabaseParam>;

class ImportDatabaseUseCase implements ImportDatabase {
  @override
  Future<Optional<bool>> call(ImportDatabaseParam param) async {
    try {
      return sl<KeyValues>().importDatabase(param.map).then((value) => Optional.newValue(true));
    } on Exception catch (e, st) {
      return Optional.newError(e, st);
    }
  }
}
