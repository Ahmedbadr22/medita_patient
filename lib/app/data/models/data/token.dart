class Token {
  String access;
  String refresh;

  Token(this.access, this.refresh);

  String getBearerToken() {
    return "Bearer $access";
  }
}