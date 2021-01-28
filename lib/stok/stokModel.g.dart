// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stokModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StokModel _$StokModelFromJson(Map<String, dynamic> json) {
  return StokModel(
      id: json['id'] as String,
      name: json['name'] as String,
      code: json['code'] as String,
      type: (json['type'] as List)?.map((e) => e as String)?.toList(),
      stokDate: json['stokDate'] == null
          ? null
          : DateTime.parse(json['stokDate'] as String))
    ..malzeme = json['Malzeme'] == null
        ? null
        : MalzemeItem.fromJson(json['Malzeme'] as Map<String, dynamic>);
}

Map<String, dynamic> _$StokModelToJson(StokModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'type': instance.type,
      'stokDate': instance.stokDate?.toIso8601String(),
      'Malzeme': instance.malzeme
    };
