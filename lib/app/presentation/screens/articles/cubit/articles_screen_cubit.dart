import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medita_patient/app/data/models/data/failure/auth/auth_failure.dart';
import 'package:medita_patient/app/presentation/screens/articles/cubit/articles_screen_states.dart';

import '../../../../data/models/data/articles/article.dart';
import '../../../../data/models/data/articles/category.dart';
import '../../../../domain/use_cases/article/list_most_liked_articles_use_case.dart';
import '../../../../domain/use_cases/category/list_article_categories_use_case.dart';

class ArticleScreenCubit extends Cubit<ArticleScreenStates> {
  final ListMostLikedArticlesUseCase _listMostLikedArticlesUseCase;
  final ListArticleCategoriesUseCase _listArticleCategoriesUseCase;

  List<Article> articles = [];
  List<Category> categories = [];

  static ArticleScreenCubit get(BuildContext context) =>
      BlocProvider.of(context);

  ArticleScreenCubit(
    this._listMostLikedArticlesUseCase,
    this._listArticleCategoriesUseCase,
  ) : super(ArticleScreenInitState());

  init() {
    listMostLikedArticles();
    listArticleCategories();
  }

  void listMostLikedArticles() async {
    emit(ArticleScreenDataLoadingState(true));
    Either<Failure, List<Article>> response =
        await _listMostLikedArticlesUseCase.execute();
    response.fold((failure) {
      print("===> Fail ${failure.message}");
    }, (data) {
      articles = data;
      emit(ArticleScreenDataSuccessLoadedState(false));
    });
  }

  void listArticleCategories() async {
    emit(ArticleScreenDataLoadingState(true));
    Either<Failure, List<Category>> response = await _listArticleCategoriesUseCase.execute();
    response.fold((failure) {
      print("===> Fail ${failure.message}");
    }, (data) {
      categories = data;
      emit(ArticleScreenDataSuccessLoadedState(false));
    });
  }
}
