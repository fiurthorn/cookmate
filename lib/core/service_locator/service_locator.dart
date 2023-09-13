import 'package:cookmate/book/data/datasources/file_source.dart';
import 'package:cookmate/book/data/datasources/hive_store/initialize.dart';
import 'package:cookmate/book/data/datasources/native.dart';
import 'package:cookmate/book/data/repositories/convert.dart';
import 'package:cookmate/book/data/repositories/disk_source.dart';
import 'package:cookmate/book/data/repositories/key_values.dart';
import 'package:cookmate/book/data/repositories/media_store.dart';
import 'package:cookmate/book/domain/repositories/convert.dart';
import 'package:cookmate/book/domain/repositories/disk_source.dart';
import 'package:cookmate/book/domain/repositories/key_values.dart';
import 'package:cookmate/book/domain/repositories/media_store.dart';
import 'package:cookmate/book/domain/usecases/export_attachment.dart';
import 'package:cookmate/book/domain/usecases/export_database.dart';
import 'package:cookmate/book/domain/usecases/load_list_items.dart';
import 'package:cookmate/book/domain/usecases/read_files.dart';
import 'package:cookmate/book/domain/usecases/store_list_items.dart';
import 'package:cookmate/core/lib/logger.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<GetIt> initServiceLocator() async {
  try {
    // data broker
    sl.registerSingleton<Native>(Native());
    sl.registerSingletonAsync<FileSource>(() async => FileSource());

    // repositories
    sl.registerSingletonAsync<KeyValues>(
        () async => KeyValuesImpl(await initHive(await sl<Native>().getAppConfigurationDir())));
    sl.registerSingletonAsync<DiskSource>(() async => DiskSourceImpl());
    sl.registerSingletonAsync<MediaStore>(() async => MediaStoreImpl());
    sl.registerSingletonAsync<ImageConverter>(() async => ImageConverterImpl());

    // use cases
    sl.registerLazySingleton<ReadFiles>(() => ReadFilesUseCase());
    sl.registerLazySingleton<LoadListItems>(() => LoadListItemsUseCase());
    sl.registerLazySingleton<ExportDatabase>(() => ExportDatabaseUseCase());
    sl.registerLazySingleton<StoreListItems>(() => StoreListItemsUseCase());
    sl.registerLazySingleton<ExportAttachment>(() => ExportAttachmentUseCase());

    // wait to ready
    return sl.allReady().then((value) => sl).whenComplete(() => Log.less("service locator ready"));
  } on Exception catch (err, stack) {
    Log.high("sl", error: err, stackTrace: stack);
    rethrow;
  }
}
