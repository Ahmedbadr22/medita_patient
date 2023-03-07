// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleResponse _$ArticleResponseFromJson(Map<String, dynamic> json) =>
    ArticleResponse(
      json['id'] as int?,
      json['title'] as String?,
      json['body'] as String?,
      json['cover_image'] as String?,
      json['date_of_publish'] as String?,
      json['category'] == null
          ? null
          : CategoryResponse.fromJson(json['category'] as Map<String, dynamic>),
      (json['likes'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );

Map<String, dynamic> _$ArticleResponseToJson(ArticleResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'cover_image': instance.coverImageUrl,
      'date_of_publish': instance.dateOfPublish,
      'category': instance.categoryResponse,
      'likes': instance.likes,
    };
