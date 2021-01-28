import 'package:hello_world/stok/custom_datetime_converter.dart';
import 'package:hello_world/stok/malzeme/malzemeModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stokModel.g.dart';

@JsonSerializable()
//@CustomDateTimeConverter()
class StokModel extends Object{
  String id;
  String name;
  String code;
  List<String> type;
  DateTime stokDate;

  @JsonKey(name:'Malzeme')
  MalzemeItem malzeme;

  StokModel({this.id, this.name, this.code,this.type,this.stokDate});

  factory StokModel.fromJson(Map<String, dynamic> json) => _$StokModelFromJson(json);
  Map<String,dynamic> toJson()=>_$StokModelToJson(this);
}
