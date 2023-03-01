
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_response.g.dart';

@JsonSerializable()
class CategoryResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;



  CategoryResponse(this.id, this.name);

  /// fromJson named constructor to convert json to HospitalResponse object
  /// by giving [json] which is a map object as a parameter
  factory CategoryResponse.fromJson(Map<String, dynamic> json) => _$CategoryResponseFromJson(json);

  /// toJson named constructor to convert HospitalResponse   object to json "map object"
  Map<String, dynamic> toJson() => _$CategoryResponseToJson(this);
}