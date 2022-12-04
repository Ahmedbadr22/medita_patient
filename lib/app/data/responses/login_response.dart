import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: "access")
  String? accessToken;
  @JsonKey(name: "refresh")
  String? refreshToken;

  LoginResponse(this.accessToken, this.refreshToken);

  /// fromJson named constructor to convert json to LoginResponse object
  /// by giving [json] which is a map object as a parameter
  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

  /// toJson named constructor to convert LoginResponse object to json "map object"
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

}