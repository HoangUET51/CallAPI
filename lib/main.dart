import 'package:dio/dio.dart';
import 'package:dio_flutter/api_service.dart';
import 'package:dio_flutter/post_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


final dio = Dio();
final client = RestClient(dio);

void main() {
  dio.interceptors.add(PrettyDioLogger());
  runApp(MaterialApp(
    home: PostPage(),
  ));
}