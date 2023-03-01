import 'package:medita_patient/app/data/network/api/article/article_client_api.dart';
import 'package:medita_patient/app/data/responses/article/article_response.dart';
import 'package:medita_patient/app/data/responses/article/category_response.dart';
import 'package:medita_patient/app/data/responses/bookmark/bookmark_response.dart';

class ArticleDataSource {
  late final ArticleClientApi _api;

  ArticleDataSource(this._api);

  Future<List<ArticleResponse>> listMostLikedArticles() {
    return _api.listMostLikedArticles();
  }

  Future<List<CategoryResponse>> listArticleCategories() {
    return _api.listArticleCategories();
  }

  Future<List<BookmarkResponse>> listUserArticlesBookMarks() {
    int userId = 2;
    return _api.listUserArticlesBookMarks(userId);
  }
}