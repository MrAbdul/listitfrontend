

import 'package:json_annotation/json_annotation.dart';

part 'request.g.dart';

@JsonSerializable()
class RegisterRequest{
  const RegisterRequest({this.name, this.email, this.password});
  factory RegisterRequest.fromJson(Map<String,dynamic> json)=>_$RegisterRequestFromJson(json);
  final String? name     ;
  final String? email    ;
  final String? password ;
  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}

@JsonSerializable()
class LoginRequest{
  const LoginRequest({this.email, this.password});
  factory LoginRequest.fromJson(Map<String,dynamic> json) => _$LoginRequestFromJson(json);
  final String? email;
  final String? password;
  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);

}