

import 'package:dartz/dartz.dart';

import '../../../data/models/data/articles/article.dart';
import '../../../data/models/data/failure/auth/auth_failure.dart';
import '../../../data/repositories/article/article_repository.dart';

class ListUserBookmarksArticlesUseCase {
  late final ArticleRepository _repository;

  ListUserBookmarksArticlesUseCase(this._repository);

  Future<Either<Failure, List<Article>>> execute() async {
    return await _repository.listUserArticlesBookMarks();
  }
}