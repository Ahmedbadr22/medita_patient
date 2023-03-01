
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "profile_image")
  String? profileImagePath;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "fullname")
  String? fullName;
  @JsonKey(name: "birth_date")
  String? birthDate;


  UserResponse(this.id, this.profileImagePath, this.email, this.fullName, this.birthDate);

  /// fromJson named constructor to convert json to UserResponse object
  /// by giving [json] which is a map object as a parameter
  factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);

  /// toJson named constructor to convert UserResponse   object to json "map object"
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}
