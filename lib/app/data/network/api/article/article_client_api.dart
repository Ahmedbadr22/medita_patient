import 'package:dio/dio.dart';
import 'package:medita_patient/app/data/responses/article/article_response.dart';
import 'package:medita_patient/app/data/responses/bookmark/bookmark_response.dart';
import 'package:retrofit/http.dart';

import '../../../../app/constants.dart';
import '../../../responses/article/category_response.dart';

part 'article_client_api.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ArticleClientApi {
  factory ArticleClientApi(Dio dio, {String baseUrl}) = _ArticleClientApi;

  @GET(ApiConstants.listMostLikedArticles)
  Future<List<ArticleResponse>> listMostLikedArticles();

  @GET(ApiConstants.listArticleCategories)
  Future<List<CategoryResponse>> listArticleCategories();

  @GET(ApiConstants.listUserArticlesBookMarks)
  Future<List<BookmarkResponse>> listUserArticlesBookMarks(@Path() int id);
}