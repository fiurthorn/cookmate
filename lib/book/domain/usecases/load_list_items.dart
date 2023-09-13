import 'package:cookmate/book/domain/repositories/key_values.dart';
import 'package:cookmate/book/domain/usecases/usecase.dart';
import 'package:cookmate/core/lib/optional.dart';
import 'package:cookmate/core/service_locator/service_locator.dart';

export 'call.dart';

class LoadListItemsParam {
  final KeyValueNames key;

  LoadListItemsParam(this.key);
}

typedef LoadListItems = UseCase<List<String>, LoadListItemsParam>;

class LoadListItemsUseCase implements LoadListItems {
  @override
  Future<Optional<List<String>>> call(LoadListItemsParam param) async {
    try {
      return Optional.newValue(await sl<KeyValues>().getItems(param.key));
    } on Exception catch (e, st) {
      return Optional.newError(e, st);
    }
  }
}
