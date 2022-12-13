class ApiConstants {
  // Server baseUrl
  static const String baseUrl = "https://6081-154-239-215-52.eu.ngrok.io/";
  // main app url
  static const String _authenticationUrl = "authentication";
  static const String _clinicUrl = "clinic";

  /// End Points Urls
  // Authentication Urls
  static const String loginUrl = "$_authenticationUrl/login";
  static const String userRegistrationUrl = "$_authenticationUrl/user-register";

  // Clinic Urls
  static const String listHospitals = "$_clinicUrl/list-hospitals";
}
