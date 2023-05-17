import 'package:freezed_annotation/freezed_annotation.dart';

part 'meeting_response.g.dart';

@JsonSerializable()
class MeetingResponse {
  @JsonKey(name: "meeting_link")
  String? meetingLink;




  MeetingResponse(this.meetingLink);

  /// by giving [json] which is a map object as a parameter
  factory MeetingResponse.fromJson(Map<String, dynamic> json) => _$MeetingResponseFromJson(json);

  /// toJson named constructor to convert ArticleResponse   object to json "map object"
  Map<String, dynamic> toJson() => _$MeetingResponseToJson(this);
}