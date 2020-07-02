///
/// [Author] Alex (https://github.com/AlexVincent525)
/// [Date] 2020/7/1 13:17
///
import 'package:flutter/material.dart';

export 'package:flutter_common_exports/flutter_common_exports.dart';
export 'package:hive/hive.dart';
export 'package:hive_flutter/hive_flutter.dart';

export '../models/models.dart';
export '../widgets/fixed_appbar.dart';

export 'hive_boxes.dart';

class Constants {
  const Constants._();

  static const List<IconData> navigationIcons = <IconData>[
    Icons.threesixty,
    Icons.assessment,
    Icons.settings,
  ];
  static const List<String> navigationItems = <String>[
    '摇它',
    '记录',
    '配置',
  ];
}
