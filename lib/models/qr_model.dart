import 'dart:typed_data';

import 'package:hive/hive.dart';

part 'qr_model.g.dart';

@HiveType(typeId: 0)
class QrModel extends HiveObject {
  @HiveField(0)
  final String qrData;
  @HiveField(1)
  final String date;
  @HiveField(2)
  final Uint8List image;
  QrModel(this.image, {required this.date, required this.qrData});
}
