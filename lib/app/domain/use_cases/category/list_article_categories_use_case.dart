import 'package:dartz/dartz.dart';
import 'package:medita_patient/app/data/repositories/article/article_repository.dart';

import '../../../data/models/data/articles/category.dart';
import '../../../data/models/data/failure/auth/auth_failure.dart';

class ListArticleCategoriesUseCase {
  late final ArticleRepository _repository;

  ListArticleCategoriesUseCase(this._repository);

  Future<Either<Failure, List<Category>>> execute() async {
    return _repository.listArticleCategories();
  }
}