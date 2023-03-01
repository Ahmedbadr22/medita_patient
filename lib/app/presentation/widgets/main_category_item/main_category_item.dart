import 'package:flutter/material.dart';
import 'package:medita_patient/app/data/models/data/articles/category.dart';

import '../../manager/values_manager.dart';

class MainCategoryItem extends StatelessWidget {
  const MainCategoryItem({
    Key? key,
    required this.category
  }) : super(key: key);

  final Category category;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Container(
        decoration:  BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            border: Border.all(
              color: Theme.of(context).primaryColor,
              width: 2
            )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8, vertical: AppPadding.p4),
          child: Text(
            category.name,
            style: TextStyle(
                color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}
