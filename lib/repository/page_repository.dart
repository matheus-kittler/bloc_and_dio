import 'dart:convert';

import 'package:bloc_and_dio_test/model/recover.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class PageRepository {
  // Dio dio;
  //
  // PageRepository(this.dio);
  //
  // Future<List<Recover>> findAll() {
  //   return dio.get('/data.json', options: {
  //
  //   }).then((value) => null)
  // }
  
  // late Response response;
  // Dio dio = Dio();
  // response = await dio.get('https://gb-mobile-app-teste.s3.amazonaws.com/data.json');
  // var listRecovers = (response.data as List).map((item) {
  //   return Recover.fromJson(item);
  // }).toList();

  getHttp() async {
    try {
      var response = await Dio().get('https://gb-mobile-app-teste.s3.amazonaws.com/data.json');
      if (kDebugMode) {
        print(response);
      }
    } catch(e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}