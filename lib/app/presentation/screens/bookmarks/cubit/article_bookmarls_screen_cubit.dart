
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/data/articles/article.dart';
import '../../../../data/models/data/failure/auth/auth_failure.dart';
import '../../../../domain/use_cases/article/list_user_bookmarks_articles.dart';
import 'articles_bookmarks_screen_states.dart';

class ArticlesBookMarksScreenCubit extends Cubit<ArticlesBookMarksScreenState> {
  final ListUserBookmarksArticlesUseCase _listUserBookmarksArticles;

  ArticlesBookMarksScreenCubit(this._listUserBookmarksArticles) : super(ArticlesBookMarksScreenInitState());

  static ArticlesBookMarksScreenCubit get(BuildContext context) => BlocProvider.of(context);

  List<Article> articles = [];

  init() {
    listMostLikedArticles();
  }

  void listMostLikedArticles() async {
    emit(ArticlesBookMarksScreenLoadingState());
    Either<Failure, List<Article>> response = await _listUserBookmarksArticles.execute();
    response.fold(
            (failure) => {
              print("===> Fail ${failure.message}")
            },
            (data) => {
          articles = data,
              print(data),
          emit(ArticlesBookMarksScreenSuccessDataState()),
        });
  }


}