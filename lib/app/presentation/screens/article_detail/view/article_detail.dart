import 'package:flutter/material.dart';
import 'package:medita_patient/app/app/extensions.dart';
import 'package:medita_patient/app/data/models/data/articles/article.dart';
import 'package:medita_patient/app/presentation/manager/color_manager.dart';
import 'package:medita_patient/app/presentation/manager/styles_manager.dart';
import 'package:medita_patient/app/presentation/widgets/common_app_bar/common_app_bar.dart';

import '../../../../app/utils.dart';
import '../../../manager/values_manager.dart';
import '../../../widgets/category_item/category_item.dart';

class ArticleDetailScreen extends StatelessWidget {
  const ArticleDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Article? article = ModalRoute.of(context)?.settings.arguments as Article;

    return Scaffold(
      appBar: commonAppBar(
        actions: <IconButton>[
          IconButton(
            icon: const Icon(Icons.bookmark_add_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.send_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p16, vertical: AppPadding.p8),
          child: Column(
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.all(Radius.circular(AppSize.s20)),
                  child: Image.network(
                    article.coverImageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              15.ph,
              Text(
                article.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              10.ph,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                  CategoryItem(category: article.category),
                  10.pw,
                  const Icon(
                    Icons.star_half,
                    color: Colors.orange,
                  ),
                  Text("(${article.likes.length})")
                ],
              ),
              10.ph,
              const Divider(),
              10.ph,
              Text(
                article.body,
                textAlign: TextAlign.justify,
                style: getRegularStyle(color: ColorManager.lightBlack),
              )
            ],
          ),
        ),
      ),
    );
  }
}
