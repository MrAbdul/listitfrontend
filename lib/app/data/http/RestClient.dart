import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:listit/app/data/models/request.dart';
import 'package:listit/app/data/models/response.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'RestClient.g.dart';

@RestApi(baseUrl: 'https://greenlight.abdulalsh.com/v1')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST("/users")
  Future<HttpResponse<dynamic>> registerUser(@Body() RegisterRequest regreq);

  @POST("/tokens/authentication")
  Future<HttpResponse<dynamic>> loginUser(@Body() LoginRequest req);
}



