// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookmarkResponse _$BookmarkResponseFromJson(Map<String, dynamic> json) =>
    BookmarkResponse(
      json['id'] as int?,
      json['article'] == null
          ? null
          : ArticleResponse.fromJson(json['article'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookmarkResponseToJson(BookmarkResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'article': instance.articleResponse,
    };
