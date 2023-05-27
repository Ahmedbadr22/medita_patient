

abstract class ArticleScreenStates {
  bool mostLikedLoading;
  ArticleScreenStates({this.mostLikedLoading = false});
}

class ArticleScreenInitState extends ArticleScreenStates {
}
class ArticleScreenDataLoadingState extends ArticleScreenStates {
  ArticleScreenDataLoadingState(bool mostLikedLoading) : super(mostLikedLoading: mostLikedLoading);
}
class ArticleScreenDataSuccessLoadedState extends ArticleScreenStates {
  ArticleScreenDataSuccessLoadedState(bool mostLikedLoading) : super(mostLikedLoading: mostLikedLoading);
}
