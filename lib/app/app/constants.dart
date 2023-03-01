
class ApiConstants {
  // Server baseUrl
  static const String baseUrl = "https://bf4a-156-187-62-138.eu.ngrok.io/";
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

  // Articles
  static const String listMostLikedArticles = "$_articlesUrl/list-most-liked-articles";
  static const String listArticleCategories = "$_articlesUrl/list-categories";

  // Bookmark
  static const String addArticleBookMark = "$_articlesUrl/add-bookmark";
  static const String listUserArticlesBookMarks = "$_articlesUrl/list-user-bookmarks/{id}";
  // Appointment
  static const String listUserAppointments = "$_clinicUrl/list-appointments-by-user/{id}";


}