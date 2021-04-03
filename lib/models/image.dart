import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()

class Image {

  final String thumb;
  final String small;
  final String large;

  Image({this.thumb, this.small, this.large});

  static fromJson(Map<String, dynamic> json) => json != null ? _$ImageFromJson(json) : null;
  Map<String, dynamic> toJson() => _$ImageToJson(this);
  
}