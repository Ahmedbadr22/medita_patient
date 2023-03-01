import 'package:freezed_annotation/freezed_annotation.dart';
import 'category_response.dart';

part 'article_response.g.dart';

@JsonSerializable()
class ArticleResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "body")
  String? body;
  @JsonKey(name: "cover_image")
  String? coverImageUrl;
  @JsonKey(name: "date_of_publish")
  String? dateOfPublish;
  @JsonKey(name: "category")
  CategoryResponse? categoryResponse;
  @JsonKey(name: "likes")
  List<int>? likes;


  ArticleResponse(this.id, this.title, this.body, this.coverImageUrl, this.dateOfPublish, this.categoryResponse, this.likes);

  /// fromJson named constructor to convert json to ArticleResponse object
  /// by giving [json] which is a map object as a parameter
  factory ArticleResponse.fromJson(Map<String, dynamic> json) => _$ArticleResponseFromJson(json);

  /// toJson named constructor to convert ArticleResponse   object to json "map object"
  Map<String, dynamic> toJson() => _$ArticleResponseToJson(this);
}