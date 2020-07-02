///
/// [Author] Alex (https://github.com/AlexVincent525)
/// [Date] 2020/7/1 13:20
///
part of 'models.dart';

@HiveType(typeId: HiveAdapterTypeIds.eatLocation)
class EatLocation with HiveObject implements BaseModel {
  EatLocation({this.name, this.weight});

  @HiveField(0)
  final String name;
  @HiveField(1)
  final double weight;

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'weight': weight,
    };
  }
}