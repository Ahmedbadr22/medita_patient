import 'package:dartz/dartz.dart';
import 'package:medita_patient/app/data/responses/bookmark/bookmark_response.dart';
import '../../models/data/articles/category.dart';
import 'package:medita_patient/app/data/mapper/article/article_mapper.dart';
import 'package:medita_patient/app/data/mapper/article/category_mapper.dart';
import 'package:medita_patient/app/data/models/data/articles/article.dart';
import 'package:medita_patient/app/data/network/network_info.dart';
import 'package:medita_patient/app/data/responses/article/article_response.dart';
import 'package:medita_patient/app/data/responses/article/category_response.dart';

import '../../data_sources/remote/article/article_data_source.dart';
import '../../handler/exception_handler/login/login_exception_handler.dart';

import '../../models/data/failure/auth/auth_failure.dart';
import '../../network/status_code/status_code.dart';

class ArticleRepository {
  late final ArticleDataSource _dataSource;
  late final NetworkInfo _networkInfo;

  ArticleRepository(this._dataSource, this._networkInfo);

  Future<Either<Failure, List<Article>>> listMostLikedArticles() async {
    if(!await _networkInfo.isConnected()) {
      Failure noInternetConnectionFailure = StatusCode.noInternetConnection.getAuthenticationFailure();
      return Left(noInternetConnectionFailure);
    }

    try {
      List<ArticleResponse> articlesResponse = await _dataSource.listMostLikedArticles();
      List<Article> articles = articlesResponse.map((article) => article.toDomain()).toList();
      return Right(articles);
    } catch(error) {
      BaseExceptionHandler baseExceptionHandler = BaseExceptionHandler();
      baseExceptionHandler.handler(error);
      return Left(baseExceptionHandler.failure);
    }
  }

  /// List articles categories
  Future<Either<Failure, List<Category>>> listArticleCategories() async {
    if(!await _networkInfo.isConnected()) {
      Failure noInternetConnectionFailure = StatusCode.noInternetConnection.getAuthenticationFailure();
      return Left(noInternetConnectionFailure);
    }

    try {
      List<CategoryResponse> articlesResponse = await _dataSource.listArticleCategories();
      List<Category> articles = articlesResponse.map((article) => article.toDomain()).toList();
      return Right(articles);
    } catch(error) {
      BaseExceptionHandler baseExceptionHandler = BaseExceptionHandler();
      baseExceptionHandler.handler(error);
      return Left(baseExceptionHandler.failure);
    }
  }

  /// List bookmarked articles
  Future<Either<Failure, List<Article>>> listUserArticlesBookMarks() async {
    if(!await _networkInfo.isConnected()) {
      Failure noInternetConnectionFailure = StatusCode.noInternetConnection.getAuthenticationFailure();
      return Left(noInternetConnectionFailure);
    }

    try {
      List<BookmarkResponse> articlesResponse = await _dataSource.listUserArticlesBookMarks();
      List<Article> articles = articlesResponse.map((bookmark) => bookmark.articleResponse!.toDomain()).toList();
      return Right(articles);
    } catch(error) {
      BaseExceptionHandler baseExceptionHandler = BaseExceptionHandler();
      baseExceptionHandler.handler(error);
      return Left(baseExceptionHandler.failure);
    }
  }
}