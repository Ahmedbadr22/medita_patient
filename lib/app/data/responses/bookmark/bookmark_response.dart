
import 'package:freezed_annotation/freezed_annotation.dart';

import '../article/article_response.dart';

part 'bookmark_response.g.dart';

@JsonSerializable()
class BookmarkResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "article")
  ArticleResponse? articleResponse;


  BookmarkResponse(this.id, this.articleResponse);

  /// fromJson named constructor to convert json to HospitalResponse object
  /// by giving [json] which is a map object as a parameter
  factory BookmarkResponse.fromJson(Map<String, dynamic> json) => _$BookmarkResponseFromJson(json);

  /// toJson named constructor to convert HospitalResponse   object to json "map object"
  Map<String, dynamic> toJson() => _$BookmarkResponseToJson(this);
}