import 'package:json_annotation/json_annotation.dart';
import 'package:km_test/model/user_model.dart';

part 'user_list.g.dart';

@JsonSerializable()
class UserList {
  @JsonKey(name: "page")
  int? page;

  @JsonKey(name: "per_page")
  int? perPage;

  @JsonKey(name: "total")
  int? total;

  @JsonKey(name: "total_pages")
  int? totalPages;

  @JsonKey(name: "data")
  List<User>? data;

  UserList();

  factory UserList.fromJson(Map<String, dynamic> json) =>
      _$UserListFromJson(json);
  Map<String, dynamic> toJson() => _$UserListToJson(this);
}
