import 'package:cookmate/book/domain/repositories/key_values.dart';
import 'package:cookmate/book/domain/usecases/usecase.dart';
import 'package:cookmate/core/lib/optional.dart';
import 'package:cookmate/core/service_locator/service_locator.dart';

export 'call.dart';

class StoreListItemsParam {
  final List<String> items;
  final KeyValueNames key;

  StoreListItemsParam(this.key, this.items);
}

typedef StoreListItems = UseCase<bool, StoreListItemsParam>;

class StoreListItemsUseCase implements StoreListItems {
  @override
  Future<Optional<bool>> call(StoreListItemsParam param) async {
    try {
      sl<KeyValues>().setItems(param.key, param.items);
      return Optional.newValue(true);
    } on Exception catch (e, st) {
      return Optional.newError(e, st);
    }
  }
}
