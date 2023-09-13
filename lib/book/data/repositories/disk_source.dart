import 'dart:io';

import 'package:cookmate/book/domain/repositories/disk_source.dart';
import 'package:cookmate/core/lib/tuple.dart';
import 'package:flutter/foundation.dart';

class DiskSourceImpl implements DiskSource {
  @override
  List<Tuple2<String, Uint8List>> readFiles(List<String> paths) {
    final images = paths.map((path) => Tuple2(path, File(path).readAsBytesSync())).toList();
    for (var path in paths) {
      File(path).deleteSync();
    }
    return images;
  }
}
