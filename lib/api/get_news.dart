import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_app/models/news_response_model.dart';

class GetNewsService {
  final Dio _dio = Dio();

  Future<NewsResponseModel?> getNews() async {
    try {
      Response response = await _dio.get(
        'https://newsapi.org/v2/everything?q=apple&from=2021-08-24&sortBy=publishedAt&apiKey=daafa2c051444d39a750e0b1cbc408d1&page=1',
      );
      if (response.statusCode! < 300 && response.statusCode! >= 200) {
        NewsResponseModel n = NewsResponseModel.fromJson(response.data);
        log(n.totalNews.toString(), name: 'getNewsSuccess');
        return n;
      } else {
        return null;
      }
    } on DioError catch (e) {
      log(
        e.message,
        name: 'getNewsDioError',
        stackTrace: e.stackTrace,
      );
      return null;
    } on Exception catch (e) {
      log(
        e.toString(),
        name: 'getNewsGeneralError',
      );
      return null;
    }
  }
}
