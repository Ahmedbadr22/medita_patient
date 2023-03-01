
import 'package:medita_patient/app/app/extensions.dart';
import 'package:medita_patient/app/data/responses/article/category_response.dart';

import '../../models/data/articles/category.dart';

extension NullableCategoryMapper on CategoryResponse? {
  Category toDomain() {
    if (this == null) {
      return Category(0, "name.orEmpty()");
    } else {
      return Category(this!.id.orZero(), this!.name.orEmpty());
    }
  }
}