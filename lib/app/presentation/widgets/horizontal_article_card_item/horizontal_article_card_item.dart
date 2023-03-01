

import 'package:flutter/material.dart';
import 'package:medita_patient/app/app/extensions.dart';

import '../../../app/utils.dart';
import '../../../data/models/data/articles/article.dart';
import '../../manager/routes_manager.dart';
import '../../manager/values_manager.dart';
import '../category_item/category_item.dart';

class HorizontalArticleCardItem extends StatelessWidget {
  const HorizontalArticleCardItem({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.articleDetailRoute, arguments: article);
      },
      child: SizedBox(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(AppSize.s20)),
                child: Image.network(
                  article.coverImageUrl,
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                      children: <Widget> [
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
