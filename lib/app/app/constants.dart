
class ApiConstants {
  // Server baseUrl
  static const String baseUrl = "https://api.meditahealthcare.me/";
  static const String meetingBaseUrl = "http://google-meeting.meditahealthcare.me/";
  static const String stomachDiseasePredictUrl = "https://ahmedbadrdev-stomach.hf.space/run/predict";
  static const String brainDiseasePredictUrl = "https://ahmedbadrdev-brain.hf.space/run/predict";
  // main app url
  static const String _authenticationUrl = "authentication";
  static const String _clinicUrl = "clinic";
  static const String _articlesUrl = "articles";

  /// End Points Urls
  // Authentication Urls
  static const String loginUrl = "$_authenticationUrl/login";
  static const String userRegistrationUrl = "$_authenticationUrl/user-register";

  // Clinic Urls
  static const String listHospitals = "$_clinicUrl/list-hospitals";
  static const String listBanners = "$_clinicUrl/list-banners";
  static const String listSpecialties = "$_clinicUrl/list-specialities";

  // Doctor
  static const String listDoctorsBySpecialityId = "$_clinicUrl/list-doctors-by-speciality/{id}";
  static const String listUserFavoriteDoctors = "$_clinicUrl/list-favorite-doctors";

  // Articles
  static const String listMostLikedArticles = "$_articlesUrl/list-most-liked-articles";
  static const String listArticleCategories = "$_articlesUrl/list-categories";

  // Bookmark
  static const String addArticleBookMark = "$_articlesUrl/add-bookmark";
  static const String listUserArticlesBookMarks = "$_articlesUrl/list-user-bookmarks/{id}";
  // Appointment
  static const String listUserAppointments = "$_clinicUrl/list-appointments-by-user/{id}";
  static const String addAppointment = "$_clinicUrl/add-appointment";

  static const String createMeeting = "api/create-meeting";

}

class SharedPrefConstants {
  // SharedPref
  static const String accessToken = "accessToken";
  static const String refreshToken = "refreshToken";
}