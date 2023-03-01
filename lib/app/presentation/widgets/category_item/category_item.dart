import 'package:flutter/material.dart';

import '../../../data/models/data/articles/category.dart';
import '../../manager/values_manager.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.category
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        color: Theme.of(context).primaryColor.withOpacity(0.1)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p6, vertical: AppPadding.p4),
        child: Text(
          category.name,
          style: TextStyle(
            fontSize: 10,
            color: Theme.of(context).primaryColor
          ),
        ),
      ),
    );
  }
}
