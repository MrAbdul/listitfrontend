
import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable()
class ErrorResponse {
  final Map<String, String> error;

  ErrorResponse({required this.error});

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => _$ErrorResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorResponseToJson(this);
}

@JsonSerializable()
class User {
  final int id;
  @JsonKey(name: 'created_at')
  final String createdAt;
  final String name;
  final String email;
  final bool activated;

  User({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.email,
    required this.activated,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
@JsonSerializable()
class Token{
  Token({required this.token, required this.expiry});
  final String? token;
  final String? expiry;
  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);
  Map<String, dynamic> toJson() => _$TokenToJson(this);

}

@JsonSerializable()
class UserResponse {
  final User user;

  UserResponse({required this.user});

  factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}
@JsonSerializable()
class TokenResponse {
  @JsonKey(name: "authentication_token")
  final Token token;

  TokenResponse({required this.token});

  factory TokenResponse.fromJson(Map<String, dynamic> json) => _$TokenResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TokenResponseToJson(this);
}


class ApiResponse<T> {
  T? data;
  ErrorResponse? error;

  ApiResponse({this.data, this.error});
}