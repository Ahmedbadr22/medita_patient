

abstract class HomeScreenState {
  bool isBannerLoading ;
  HomeScreenState({this.isBannerLoading = false});
}
class HomeScreenInitState extends HomeScreenState {}
class HomeScreenLoadingGetAllBannersState extends HomeScreenState {
  HomeScreenLoadingGetAllBannersState(bool isBannerLoading) : super(isBannerLoading: isBannerLoading);
}
class HomeScreenSuccessGetAllBannersState extends HomeScreenState {
  HomeScreenSuccessGetAllBannersState(bool isBannerLoading) : super(isBannerLoading: isBannerLoading);
}
class HomeScreenSuccessGetSpecialitiesState extends HomeScreenState {}
class HomeScreenSuccessGetHospitalsState extends HomeScreenState {}