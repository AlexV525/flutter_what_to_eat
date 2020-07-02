///
/// [Author] Alex (https://github.com/AlexVincent525)
/// [Date] 2020/7/1 13:35
///
import 'dart:convert';

import 'package:what_to_eat/constants/constants.dart';

part 'models.g.dart';

part 'eat_location.dart';

part 'record.dart';

abstract class BaseModel {
  Map<String, dynamic> toJson();

  @override
  String toString() {
    return const JsonEncoder.withIndent('  ').convert(toJson());
  }
}