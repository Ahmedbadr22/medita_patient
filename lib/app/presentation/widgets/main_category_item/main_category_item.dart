import 'package:flutter/material.dart';
import 'package:medita_patient/app/data/models/data/articles/category.dart';


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
      child: Chip(label: Text(category.name),),
    );
  }
}
