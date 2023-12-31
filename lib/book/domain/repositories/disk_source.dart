import 'dart:typed_data';

import 'package:cookmate/core/lib/tuple.dart';

abstract class DiskSource {
  List<Tuple2<String, Uint8List>> readFiles(List<String> paths);
}
