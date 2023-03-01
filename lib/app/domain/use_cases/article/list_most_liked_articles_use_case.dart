

import 'package:dartz/dartz.dart';
import 'package:medita_patient/app/data/models/data/articles/article.dart';
import 'package:medita_patient/app/data/repositories/article/article_repository.dart';

import '../../../data/models/data/failure/auth/auth_failure.dart';

class ListMostLikedArticlesUseCase {
  late final ArticleRepository _articleRepository;

  ListMostLikedArticlesUseCase(this._articleRepository);

  Future<Either<Failure, List<Article>>> execute() async {
    return await _articleRepository.listMostLikedArticles();
  }

}