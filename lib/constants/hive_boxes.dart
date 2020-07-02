///
/// [Author] Alex (https://github.com/AlexVincent525)
/// [Date] 2020/7/1 13:26
///
import 'package:what_to_eat/constants/constants.dart';

const String hiveBoxPrefix = 'what_to_eat';

class HiveBoxes {
  const HiveBoxes._();

  static Box<EatLocation> eatLocationBox;
  static Box<String> firstOpenDateBox;
  static Box<Record> recordBox;

  static Future<void> openBoxes() async {
    Hive
      ..registerAdapter(EatLocationAdapter())
      ..registerAdapter(RecordAdapter());

    eatLocationBox = await Hive.openBox<EatLocation>('${hiveBoxPrefix}_eat_location');
    firstOpenDateBox = await Hive.openBox<String>('${hiveBoxPrefix}_first_open_date_box');
    recordBox = await Hive.openBox<Record>('${hiveBoxPrefix}_record_box');
  }
}

class HiveAdapterTypeIds {
  const HiveAdapterTypeIds._();

  static const int eatLocation = 0;
  static const int record = 1;
}
