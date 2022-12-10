import 'package:json_annotation/json_annotation.dart';
part 'registration_response.g.dart';

@JsonSerializable()
class RegistrationResponse {
  @JsonKey(name: "first_name")
  String? firstName;
  @JsonKey(name: "last_name")
  String? lastName;
  @JsonKey(name: "email")
  String? email;

  RegistrationResponse(this.firstName, this.lastName, this.email);

  /// fromJson named constructor to convert json to RegistrationResponse object
  /// by giving [json] which is a map object as a parameter
  factory RegistrationResponse.fromJson(Map<String, dynamic> json) => _$RegistrationResponseFromJson(json);

  /// toJson named constructor to convert RegistrationResponse object to json "map object"
  Map<String, dynamic> toJson() => _$RegistrationResponseToJson(this);

}