import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medita_patient/app/app/extensions.dart';
import 'package:medita_patient/app/data/models/data/articles/article.dart';
import 'package:medita_patient/app/data/models/data/articles/category.dart';
import 'package:medita_patient/app/presentation/manager/asset_manager.dart';
import 'package:medita_patient/app/presentation/manager/routes_manager.dart';
import 'package:medita_patient/app/presentation/manager/string_manager.dart';
import 'package:medita_patient/app/presentation/manager/values_manager.dart';
import 'package:medita_patient/app/presentation/screens/articles/cubit/articles_screen_cubit.dart';
import 'package:medita_patient/app/presentation/screens/articles/cubit/articles_screen_states.dart';
import 'package:medita_patient/app/presentation/widgets/common_app_bar/common_app_bar.dart';
import 'package:medita_patient/app/presentation/widgets/horizontal_article_card_item/horizontal_article_card_item.dart';
import 'package:medita_patient/app/presentation/widgets/main_category_item/main_category_item.dart';
import 'package:medita_patient/app/presentation/widgets/section_header/section_header.dart';
import 'package:medita_patient/app/presentation/widgets/trend_card_item/trend_card.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ArticleScreenCubit cubit = ArticleScreenCubit.get(context);

    TrendCard trendCardItemBuilder(BuildContext context, int index) {
      Article article = cubit.articles[index];
      return TrendCard(article: article);
    }

    HorizontalArticleCardItem horizontalArticleCardItemBuilder(BuildContext context, int index) {
      Article article = cubit.articles[index];
      return HorizontalArticleCardItem(article: article);
    }

    MainCategoryItem mainCategoryItemBuilder(BuildContext context, int index) {
      Category category = cubit.categories[index];
      return MainCategoryItem(category: category);
    }

    return BlocConsumer<ArticleScreenCubit, ArticleScreenStates>(
        listener: (_, __) {},
        builder: (_, __) {
          return Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            appBar: commonAppBar(
              title: StringManager.articles,
              actions: <IconButton>[
                IconButton(
                  icon: SvgPicture.asset(ImageAsset.outlinedMagnifierSvg),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.bookmark_border),
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.articlesBookmarkRoute);
                  },
                ),
              ],
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
                    child: SectionHeader(
                      title: StringManager.mostLiked,
                      buttonText: StringManager.showAll,
                      onClick: () {},
                    ),
                  ),
                  SizedBox(
                    height: AppSize.s190,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: trendCardItemBuilder,
                      itemCount: cubit.articles.length,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
                    child: SectionHeader(
                      title: StringManager.articles,
                      buttonText: StringManager.showAll,
                      onClick: () {},
                    ),
                  ),
                  SizedBox(
                    height: AppSize.s30,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: mainCategoryItemBuilder,
                      itemCount: cubit.categories.length,
                    ),
                  ),
                  15.ph,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: horizontalArticleCardItemBuilder,
                      itemCount: cubit.articles.length,
                      separatorBuilder: (_, __) => 10.ph,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
