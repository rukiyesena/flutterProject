import 'package:json_annotation/json_annotation.dart';

class CustomDateTimeConverter implements JsonConverter<DateTime, String> {
  const CustomDateTimeConverter();

  @override
  DateTime fromJson(String json) =>
      json == null ? null : DateTime.parse(json);

  @override
  String toJson(DateTime object) => object.toIso8601String();
}