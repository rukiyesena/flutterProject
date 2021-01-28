import 'package:json_annotation/json_annotation.dart';

part 'malzemeModel.g.dart';

@JsonSerializable()
class MalzemeItem extends Object {
  String id;
  String name;

  MalzemeItem({this.id, this.name});

  factory MalzemeItem.fromJson(Map<String, dynamic> json) =>
      _$MalzemeItemFromJson(json);
  Map<String, dynamic> toJson() => _$MalzemeItemToJson(this);
}
