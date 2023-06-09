import 'package:flutter/material.dart';
import 'package:medita_patient/app/app/extensions.dart';
import 'package:medita_patient/app/data/models/data/articles/article.dart';
import 'package:medita_patient/app/presentation/manager/routes_manager.dart';
import 'package:medita_patient/app/presentation/widgets/category_item/category_item.dart';

import '../../../app/utils.dart';
import '../../manager/values_manager.dart';
import '../loading/loading_shimmer.dart';

class TrendCard extends StatelessWidget {
  const TrendCard({Key? key, required this.article}) : super(key: key);

  final Article article;

  Widget loadingItemBuilder(
      BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
    if (loadingProgress == null) return child;
    return const LoadingShimmer(
      width: AppSize.s100,
      height: AppSize.s100,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.articleDetailRoute,
            arguments: article);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: SizedBox(
          height: AppSize.s200,
          width: AppSize.s210,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius:
                    const BorderRadius.all(Radius.circular(AppSize.s20)),
                child: Image.network(
                  article.coverImageUrl,
                  fit: BoxFit.cover,
                  height: AppSize.s120,
                  loadingBuilder: loadingItemBuilder,
                ),
              ),
              8.ph,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title,
                      maxLines: 2,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    2.ph,
                    Row(
                      children: <Widget>[
                        Text(
                          formatDate(article.dateOfPublish),
                          maxLines: 1,
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 10,
                          ),
                        ),
                        10.pw,
                        CategoryItem(category: article.category)
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
