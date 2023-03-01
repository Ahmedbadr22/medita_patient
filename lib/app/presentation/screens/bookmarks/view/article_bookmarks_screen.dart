

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medita_patient/app/data/models/data/articles/article.dart';
import 'package:medita_patient/app/presentation/manager/string_manager.dart';
import 'package:medita_patient/app/presentation/screens/bookmarks/cubit/article_bookmarls_screen_cubit.dart';
import 'package:medita_patient/app/presentation/screens/bookmarks/cubit/articles_bookmarks_screen_states.dart';
import 'package:medita_patient/app/presentation/widgets/common_app_bar/common_app_bar.dart';
import 'package:medita_patient/app/presentation/widgets/horizontal_article_card_item/horizontal_article_card_item.dart';

class ArticlesBookmarksScreen extends StatelessWidget {
  const ArticlesBookmarksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ArticlesBookMarksScreenCubit cubit = ArticlesBookMarksScreenCubit.get(context);

    HorizontalArticleCardItem horizontalArticleCardItemBuilder(_, int index) {
      Article article = cubit.articles[index];
      return HorizontalArticleCardItem(article: article);
    }

    return BlocConsumer<ArticlesBookMarksScreenCubit, ArticlesBookMarksScreenState>(
      listener: (_, __) {},
      builder: (_, __) {
        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: commonAppBar(title: StringManager.myBookmarks),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: horizontalArticleCardItemBuilder,
              itemCount: cubit.articles.length,
            ),
          ),
        );
      },
    );
  }
}
