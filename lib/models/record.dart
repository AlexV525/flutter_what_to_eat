///
/// [Author] Alex (https://github.com/AlexVincent525)
/// [Date] 2020/7/1 13:52
///
part of 'models.dart';

@HiveType(typeId: HiveAdapterTypeIds.record)
class Record with HiveObject implements BaseModel {
  Record({this.content, this.date});

  @HiveField(0)
  final String content;
  @HiveField(1)
  final String date;

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'content': content,
      'date': date,
    };
  }
}