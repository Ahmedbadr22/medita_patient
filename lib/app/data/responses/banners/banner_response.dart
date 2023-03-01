import 'package:freezed_annotation/freezed_annotation.dart';


part 'banner_response.g.dart';

@JsonSerializable()
class BannerResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "body")
  String? body;
  @JsonKey(name: "image")
  String? imageUrl;


  BannerResponse(this.id, this.title, this.body, this.imageUrl);

  /// fromJson named constructor to convert json to HospitalResponse object
  /// by giving [json] which is a map object as a parameter
  factory BannerResponse.fromJson(Map<String, dynamic> json) => _$BannerResponseFromJson(json);

  /// toJson named constructor to convert HospitalResponse   object to json "map object"
  Map<String, dynamic> toJson() => _$BannerResponseToJson(this);
}