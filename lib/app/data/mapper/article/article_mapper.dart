
import 'package:medita_patient/app/app/extensions.dart';
import 'package:medita_patient/app/data/mapper/article/category_mapper.dart';
import 'package:medita_patient/app/data/models/data/articles/article.dart';
import 'package:medita_patient/app/data/responses/article/article_response.dart';

extension NullableArticleResponseMapper on ArticleResponse {
  Article toDomain() {
    return Article(id.orZero(), title.orEmpty(), body.orEmpty(), coverImageUrl.orEmpty(), dateOfPublish.orEmpty(), categoryResponse.toDomain(), likes.orEmpty());
  }
}