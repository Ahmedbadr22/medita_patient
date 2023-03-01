
import 'category.dart';

class Article {
  int id;
  String title;
  String body;
  String coverImageUrl;
  String dateOfPublish;
  Category category;
  List<int> likes;

  Article(this.id, this.title, this.body, this.coverImageUrl, this.dateOfPublish, this.category, this.likes);
}
