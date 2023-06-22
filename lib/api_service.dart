import 'package:dio/dio.dart';
import 'package:dio_flutter/post_entity.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/posts")
  Future<List<PostEntity>> getPosts();

  @GET("/posts/{id}")
  Future<PostEntity> getPostDetail(@Path("id") int id);

  @DELETE("/posts/{id}")
  Future<PostEntity> deletePost(@Path("id") int id);

  @POST("/posts")
  Future<PostEntity> createPost(@Body() PostEntity postEntity);

  @PUT("/posts/{id}")
  Future<PostEntity> updatePost(@Path("id") int id, @Body() PostEntity postEntity);
}