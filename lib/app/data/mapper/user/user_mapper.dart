import 'package:medita_patient/app/app/extensions.dart';
import 'package:medita_patient/app/data/models/data/user/user.dart';
import 'package:medita_patient/app/data/responses/user/user_response.dart';

extension UserResponseMapper on UserResponse? {
  User toDomain() {
    if (this == null) return User(0, "", "", "", "");

    return User(
      this!.id.orZero(),
      this!.profileImagePath.orEmpty(),
      this!.email.orEmpty(),
      this!.fullName.orEmpty(),
      this!.birthDate.orEmpty()
    );
  }
}
